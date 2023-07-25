return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  ft = { "lua", "python" },
  dependencies = {
    -- lsp support
    { -- Optional
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    -- snippet
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      lsp.buffer_autoformat()
    end)

    lsp.setup_servers({
      "lua_ls",
      "pyright",
    })

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
        { name = "nvim_lua" },
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
      },
    })
  end,
}
