local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("plugins.catppuccin")
    end,
  },
  {
    "bluz71/nvim-linefly",
    event = "VeryLazy",
    config = function()
      require("plugins.linefly")
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "InsertEnter",
    dependencies = {
      -- lsp support
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      {
        "hrsh7th/cmp-cmdline",
        config = function()
          require("plugins.cmp-cmdline")
        end,
      },
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- snippet
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.lsp-zero")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("plugins.ts-context-commentstring")
        end,
      },
      {
        "cshuaimin/ssr.nvim",
        config = function()
          require("plugins.ssr")
        end,
      },
      {
        "andymass/vim-matchup",
        config = function()
          require("plugins.vim-matchup")
        end,
      },
      {
        "Wansmer/treesj",
        config = function()
          require("plugins.treesj")
        end,
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    config = function()
      require("plugins.fzf-lua")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.indent-blankline")
    end,
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function()
      require("plugins.mini-comment")
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require("plugins.mini-surround")
    end,
  },
  {
    "chrisgrieser/nvim-genghis",
    event = "BufRead",
  },
  {
    "madyanov/svart.nvim",
    url = "https://gitlab.com/madyanov/svart.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.svart")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "beauwilliams/focus.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.focus")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.gitsigns")
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("plugins.oil")
    end,
  },
}, {
  lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
  install = {
    colorscheme = { "catppuccin-frappe" },
  },
  ui = {
    size = { height = 1, width = 1 },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "matchit",
        "matchparen",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
