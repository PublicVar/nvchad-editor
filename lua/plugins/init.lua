return {
  -- Disable this formatter that comes with nvchad 2.5 because
  -- already used formatters with Mason. For now, I don't know if
  -- it's useful nor if conflicts with mason.
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre', -- uncomment for format on save
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "configs.null-ls"
      end,
    },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.phpactor"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpactor", -- LSP
        "php-cs-fixer", -- Formatter
        "phpcs", -- Linter
        "stylua", -- Formatter
        "pyright", -- LSP
        "black", -- Formatter for python
        "prettier", -- Formatter
        "djlint",
        "typescript-language-server",
        "lua-language-server",
        "html-lsp",
        "eslint_d",
        --        "kotlin-language-server",
      },
    },
    -- config = function()
    --   require "nvchad.configs.mason"
    --   require "configs.phpactor"
    -- end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local opts = require "nvchad.configs.nvimtree"
      opts.view.adaptive_size = true
      return opts
    end,
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "xdebug/vscode-php-debug",
        build = "npm install && npm run build",
      },
      {
        "rcarriga/nvim-dap-ui",
      },
      {
        "theHamsta/nvim-dap-virtual-text",
      },
      {
        "nvim-neotest/nvim-nio",
      },
    },
    lazy = true,
    config = function()
      require "configs.nvim-dap"
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    lazy = true,
    keys = {
      { "<leader>gc", ":GitConflictListQf<CR>", silent = true, desc = "GitConflict List all conflicts" },
    },
    config = function()
      require("git-conflict").setup {
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen", -- command or function to open the conflicts list
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffAdd",
          current = "DiffText",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "tsx",
        "php",
        "phpdoc",
        "python",
        "html",
        "css",
        "javascript",
        "lua",
        "json",
        "typescript",
        "yaml",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "gitignore",
        "vimdoc",
      },
    },
  },
  {
    "kshenoy/vim-signature",
    lazy = false,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    lazy = false,
    config = function()
      require "configs.tabnine"
    end,
  },
  {
    "folke/noice.nvim",
    lazy = false,
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
      },
    },

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
