-- require("luasnip").filetype_extend("htmldjango", { "html" })

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
-- If you need to define a subdirectory
-- where phpcs should spawned.
-- useful if the phpcs config file is in
-- this subdirectory for example.
-- syntax : { "project_directory" , "subdirectory"}
-- note : "project_directory" is a regex pattern
local phpcs_custom_spwaned = {
  { "simplonline/www$", "api" },
}

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.phpcsfixer,
  formatting.prettier,
  formatting.eslint_d,
  formatting.djlint.with {
    filetypes = { "twig", "html" },
  },
  formatting.black.with { extra_args = { "--fast" } },
  lint.phpcs.with {
    -- change the spawned directory if needed
    cwd = function(params)
      local root = params.root
      for i = 1, #phpcs_custom_spwaned do
        local directory = phpcs_custom_spwaned[i][1]
        local subdirectory = phpcs_custom_spwaned[i][2]
        if string.match(root, directory) ~= nil then
          return root .. "/" .. subdirectory
        end
      end
      return root
    end,
  },
  -- lint.shellcheck,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  -- Enable debug when needed by uncommenting it
  -- debug = true,
  sources = sources,
  -- Enable format on save
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            bufnr = bufnr,
            filter = function(client)
              return client.name == "null-ls"
            end,
          }
        end,
      })
    end
  end,
}
