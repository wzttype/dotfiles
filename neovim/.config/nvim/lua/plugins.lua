local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require("packer").startup({function(use)

    use "wbthomason/packer.nvim"

    use {
        "ibhagwan/fzf-lua",
        config = function()
            require("plugins.fzf-lua")
        end
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            require("plugins.lsp-zero")
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                after = "nvim-treesitter",
                config = function()
                    require("plugins.treesitter-textobjects")
                end
            },
            {
                "nvim-treesitter/playground",
                after = "nvim-treesitter",
                config = function()
                    require("plugins.treesitter-playground")
                end
            },
        },
        event = "CursorHold",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end
    }

    use {
        "echasnovski/mini.align",
        event = "BufRead",
        config = function()
            require("mini.align").setup()
        end
    }

    use {
        "echasnovski/mini.comment",
        event = "BufRead",
        config = function()
            require("mini.comment").setup()
        end
    }

    use {
        "echasnovski/mini.indentscope",
        event = "BufReadPre",
        config = function()
            require("mini.indentscope").setup()
        end
    }

    use {
        "echasnovski/mini.pairs",
        event = "InsertCharPre",
        config = function()
            require("mini.pairs").setup()
        end
    }

    use {
        "echasnovski/mini.surround",
        event = "BufRead",
        config = function()
            require("plugins.mini-surround")
        end
    }

    use {
        "chrisgrieser/nvim-genghis",
        event = "BufEnter",
    }

    use {
        "madyanov/svart.nvim",
        event = "BufRead",
        config = function()
            require("plugins.svart")
        end
    }

    use {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        config = function()
            require("plugins.bqf")
        end
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        event = "BufEnter",
        config = function()
            require("plugins.catppuccin")
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        event = "BufEnter",
        after = "catppuccin",
        config = function()
            require("plugins.lualine")
        end
    }

    use {
        "NvChad/nvim-colorizer.lua",
        event = "CursorHold",
        config = function()
            require("colorizer").setup()
        end
    }

    use {
        "beauwilliams/focus.nvim",
        event = "BufRead",
        config = function()
            require("plugins.focus")
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        tag = "release",
        config = function()
            require("plugins.gitsigns")
        end
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end,

config = {
    display = {
        open_fn = function()
            return require("packer.util").float({
                border = "single"
            })
        end,
        prompt_border = "single",
    },
    autoremove = true,
}
})
