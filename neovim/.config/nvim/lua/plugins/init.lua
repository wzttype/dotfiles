local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
     "git",
     "clone",
     "--filter=blob:none",
     "--single-branch",
     "https://github.com/folke/lazy.nvim.git",
     lazypath,
   })
 end
 vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    {
        "ibhagwan/fzf-lua",
        config = function ()
            require("plugins.fzf-lua")
        end
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        event = "InsertEnter",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            {
                "hrsh7th/cmp-cmdline",
                config = function ()
                    require("plugins/cmp-cmdline")
                end
            },
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function ()
            require("plugins.lsp-zero")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        dependencies = {
            {
                "cshuaimin/ssr.nvim",
                init = function ()
                    vim.keymap.set({ "n", "x" }, "<leader>ssr", function () require("ssr").open() end)
                end
            },
        },
        config = function ()
            require("plugins.treesitter")
        end
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        event = "BufReadPost",
        config = function ()
            require("plugins.various-textobjects")
        end
    },
    {
        "echasnovski/mini.align",
        event = "BufRead",
        config = function ()
            require("mini.align").setup()
        end
    },
    {
        "echasnovski/mini.comment",
        event = "BufRead",
        config = function ()
            require("mini.comment").setup()
        end
    },
    {
        "echasnovski/mini.indentscope",
        event = "BufReadPre",
        config = function ()
            require("mini.indentscope").setup()
        end
    },
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        config = function ()
            require("mini.pairs").setup()
        end
    },
    {
        "echasnovski/mini.surround",
        event = "BufRead",
        config = function ()
            require("plugins.mini-surround")
        end
    },
    {
        "chrisgrieser/nvim-genghis",
        event = "BufReadPost"
    },
    {
        "madyanov/svart.nvim",
        url = "https://gitlab.com/madyanov/svart.nvim",
        event = "BufReadPost",
        config = function ()
            require("plugins.svart")
        end
    },
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        config = function ()
            require("plugins.trouble")
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = "BufEnter",
        config = function ()
            require("plugins.catppuccin")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function ()
            require("plugins.lualine")
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function ()
            require("colorizer").setup()
        end
    },
    {
        "beauwilliams/focus.nvim",
        event = "BufReadPost",
        config = function ()
            require("plugins.focus")
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = function ()
            require("plugins.gitsigns")
        end
    },
})
