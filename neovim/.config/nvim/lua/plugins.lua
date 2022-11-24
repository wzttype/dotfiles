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
        {
            "nvim-treesitter/nvim-treesitter",
            event = "CursorHold",
            run = ":TSUpdate",
            config = function()
                require("plugins.treesitter")
            end
        },
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
        {
            "p00f/nvim-ts-rainbow",
            after = "nvim-treesitter",
            config = function()
                require("plugins.treesitter-rainbow")
            end
        }
    }


    -- use {
    --     "neovim/nvim-lspconfig",
    --     event = "BufRead",
    --     config = function()
    --         require("lspconfig").marksman.setup{}
    --     end
    -- }

    -- use "williamboman/nvim-lsp-installer"

    -- use {
    --     "hrsh7th/nvim-cmp",
    --     event = "InserEnter",
        -- requires = {
        -- {
        --     "hrsh7th/cmp-nvim-lsp",
        --     after = "nvim-cmp"
        -- },
        -- {
        --     "hrsh7th/cmp-buffer",
        --     after = "nvim-cmp"
        -- },
        -- {
        --     "hrsh7th/cmp-path",
        --     after = "nvim-cmp"
        -- },
        -- {
        --     "hrsh7th/cmp-cmdline",
        --     after = "nvim-cmp"
        -- }
        -- },
    --     config = function()
    --     end
    -- }

    use {
        "ibhagwan/fzf-lua",
        config = function()
            require("plugins.fzf-lua")
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
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        config = function()
            require("plugins.bqf")
        end
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup()
        end
    }

    use {
        "madyanov/svart.nvim",
        event = "BufRead",
        config = function()
            require("plugins.svart")
        end
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
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
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        config = function()
            require("aerial").setup()
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
    profile = {
        enable = true
    }
}
})
