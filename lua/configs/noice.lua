require("noice").setup {
  lsp = {
    signature = {
      enabled = false,
    },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  routes = {
    {
      filter = { event = "notify", find = "No information available" },
      opts = { skip = true },
    },
  },
  -- messages = {
  --   enabled = true,
  --   view_error = "messages",
  -- },
}
