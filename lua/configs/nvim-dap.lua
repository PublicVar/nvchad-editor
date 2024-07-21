local dap = require "dap"
local dapui = require "dapui"
local username = os.getenv "USER"

require("nvim-dap-virtual-text").setup {
  commented = true,
}

dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "/home/" .. username .. "/.local/share/nvim/lazy/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    name = "Listen Simplon",
    type = "php",
    request = "launch",
    port = 9003,
    pathMappings = {
      ["/app/"] = "${workspaceFolder}",
    },
    ignore = { "**/vendor/**/*.php" },
  },
  {
    name = "Listen address",
    type = "php",
    request = "launch",
    port = 9003,
    ignore = { "**/vendor/**/*.php" },
  },
}
