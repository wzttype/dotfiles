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

return require("packer").startup({
    function()

        use "wbthomason/packer.nvim"

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                        "lua",
                        "yaml",
                        "json",
                        "markdown",
                        "latex",
                        "ledger",
                    },
                    highlight = {
                        enable = true,
                        use_languages = true,
                        additional_vim_regex_highlighting = true,
                    },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<CR>",
                            scope_incremental = "<CR>",
                            node_incremental = "<TAB>",
                            node_decremental = "<S-TAB>",
                        },
                    },
                    indent = {
                        enable = true
                    }
                })
                require"nvim-treesitter.install".compilers = { "clang", "gcc" }
                require"nvim-treesitter.install".prefer_git = true
            end
        }

        use {
            "p00f/nvim-ts-rainbow",
            config = function()
                require("nvim-treesitter.configs").setup({
                    rainbow = {
                        enable = true,
                        extended_mode = true,
                        max_file_lines = nil
                    }
                })
            end
        }

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("lspconfig").marksman.setup{}
            end
        }

        use "williamboman/nvim-lsp-installer"

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
            },
            config = function()
            end
        }

        use {
            "ibhagwan/fzf-lua",
            config = function()
                require("fzf-lua").setup {
                    winopts = {
                        border = "single",
                        preview = {
                            border = "noborder"
                        }
                    }
                }
                vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
            end
        }

        use {
            "echasnovski/mini.align",
            config = function()
                require("mini.align").setup()
            end
        }

        use {
            "echasnovski/mini.comment",
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
            config = function()
                require("mini.pairs").setup()
            end
        }

        use {
            "echasnovski/mini.surround",
            config = function()
                require("mini.surround").setup({
                    mappings = {
                        add = "<leader>sa",
                        delete = "<leader>sd",
                        find = "",
                        find_left = "",
                        highlight = "",
                        replace = "<leader>sr",
                        update_n_lines = "",
                    }
                })
            end
        }

        use {
            "kevinhwang91/nvim-bqf",
            ft = "qf",
            config = function()
                require("bqf").setup({
                    auto_enable = true,
                    auto_resize_height = true,
                    preview = {
                        win_height = 12,
                        win_vheight = 12,
                        delay_syntax = 80,
                        border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                    }
                })
            end
        }

        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup()
            end
        }

        use {
            "https://gitlab.com/madyanov/svart.nvim",
            event = "BufRead",
            config = function()
                require("svart").configure({
                    ui_dim_content = false,
                })
                vim.api.nvim_set_keymap("n", "s", "<cmd>Svart<CR>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap("n", "S", "<cmd>SvartRepeat<CR>", { noremap = true, silent = true })
            end
        }

        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("catppuccin").setup({
                    flavour = "frappe",
                    transparent_background = true,
                    integrations = {
                        aerial = true,
                        gitsigns = true,
                        leap = true,
                        cmp = true,
                        treesitter = true,
                        ts_rainbow = true,
                    }
                })
                vim.api.nvim_command "colorscheme catppuccin"
            end
        }


        use {
            "rebelot/heirline.nvim",
            config = function()
                require("heirline").setup(statusline)
            end
        }

        use {
            "karb94/neoscroll.nvim",
            event = "BufRead",
            config = function()
                require("neoscroll").setup()
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
            config = function()
                require("colorizer").setup()
            end
        }

        use {
            "beauwilliams/focus.nvim",
            config = function()
                require("focus").setup({
                    hybridnumber = true,
                    cursorline = false,
                })
            end
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup({
                    signs = {
                        add = {text = "▍"},
                        change = {text = "▍"},
                        delete = {text = "▁"},
                        topdelete = {text = "▔"},
                        changedelete = {text = "█"},
                    },
                    current_line_blame = true,
                })
            end
        }

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
