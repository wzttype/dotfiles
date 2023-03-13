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
    config = function()
      require("plugins.linefly")
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    ft = { "lua", "html", "css", "javascript", "python" },
    dependencies = {
      -- lsp support
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
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
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
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
    },
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = {
      "gennaro-tedesco/nvim-possession",
      config = function()
        require("plugins.posession")
      end,
    },
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
    "echasnovski/mini.ai",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
    config = function()
      require("plugins.mini-ai")
    end,
  },
  {
    "echasnovski/mini.align",
    event = "BufReadPost",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "BufReadPost",
    config = function()
      require("plugins.mini-comment")
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "BufReadPost",
    config = function()
      require("plugins.mini-surround")
    end,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },
  {
    "madyanov/svart.nvim",
    url = "https://gitlab.com/madyanov/svart.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.svart")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  {
    "gabrielpoca/replacer.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.replacer")
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
