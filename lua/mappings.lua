require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- General
map("n", "<leader>w", ":update <CR>", { desc = "General Save file" })
map("n", "<leader>X", ":%bdelete <CR>", { desc = "General Close all buffers", silent = true })
map("n", "<leader>uuid", ":GenerateUUID <CR>", { desc = "General Generate an uuid", silent = true })
map("n", "<leader>fi", function()
  vim.lsp.buf.format { async = true }
end, { desc = "General LSP formatting" })
map("n", "<leader>fm", ":Telescope marks <CR>", { desc = "General Telescope markers" })
map("n", "<C-q>", ":q!<CR>", { desc = "General Force quit", silent = true })
-- Debugger
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Debugger Start" })
map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger Toggle Breakpoint" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Debugger Step Into" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Debugger Step Over" })
map("n", "<leader>dd", function()
  require("dap").disconnect()
end, { desc = "Debugger Disconnect" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debugger Continue" })
map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Debugger Evaluate" })
map("n", "<leader>dq", function()
  require("dap").close()
end, { desc = "Debugger Quit" })
map("n", "<leader>dU", function()
  require("dapui").toggle()
end, { desc = "Debugger Toggle UI" })
map("n", "<leader>dR", function()
  require("dap").run_to_cursor()
end, { desc = "Debugger Run to Cursor" })
map("n", "<leader>dE", function()
  require("dapui").eval(vim.fn.input "[Expression] > ")
end, { desc = "Debugger Evaluate Input" })
map("n", "<leader>dC", function()
  require("dap").set_breakpoint(vim.fn.input "[Condition] > ")
end, { desc = "Conditional Breakpoint" })
map("n", "<leader>db", function()
  require("dap").step_back()
end, { desc = "Debugger Step Back" })
map("n", "<leader>dg", function()
  require("dap").session()
end, { desc = "Debugger Get Session" })
map("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Debugger Hover Variables" })
map("n", "<leader>dS", function()
  require("dap.ui.widgets").scopes()
end, { desc = "Debugger Scopes" })
map("n", "<leader>dp", function()
  require("dap").pause.toggle()
end, { desc = "Debugger Pause" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Debugger Toggle REPL" })
map("n", "<leader>dx", function()
  require("dap").terminate()
end, { desc = "Debugger Terminate" })
map("n", "<leader>du", function()
  require("dap").step_out()
end, { desc = "Debugger Step Out" })
map("v", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Debugger Evaluate" })

-- Tabufline
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Tabufline Goto next buffer" })
map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Tabufline Goto prev buffer" })
-- disable tabufline cycle through buffers default mapping
nomap("n", "<tab>")
nomap("n", "<S-tab>")

-- LSP
map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LSP Restart server", silent = true })

-- Telescope
map("n", "<leader>fW", function()
  require("telescope.builtin").live_grep {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u",
    },
  }
end, { desc = "Telescope Live grep all" })

-- Tabnine
map("n", "<leader>ai", ":TabnineLogin<CR>", { desc = "Tabnine Login", silent = true })
map("n", "<leader>ct", ":TabnineChat<CR>", { desc = "Tabnine Open Chat", silent = true })
