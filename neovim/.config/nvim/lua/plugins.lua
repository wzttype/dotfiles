local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")

return require('packer').startup {
    function()

        use 'wbthomason/packer.nvim'

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            event = 'BufRead',
            requires = {
                {
                    'p00f/nvim-ts-rainbow',
                    after = { 'nvim-treesitter' },
                    config = function()
                        require'nvim-treesitter.configs'.setup {
                            rainbow = {
                                enable = true,
                                entended_mode = true,
                                max_file_lines = nil,
                            }
                        }
                    end
                },
            },
            config = function()
                require'nvim-treesitter.configs'.setup {
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
                }
                require'nvim-treesitter.install'.compilers = { "clang", "gcc" }
                require'nvim-treesitter.install'.prefer_git = true
            end
        }

        use {
            'neovim/nvim-lspconfig',
            config = function()
                require'lspconfig'.marksman.setup{}
            end
        }

        use 'williamboman/nvim-lsp-installer'

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
            },
            config = function()
            end
        }

        use {
            'ibhagwan/fzf-lua',
            config = function()
                vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
            end
        }

        use {
            'echasnovski/mini.align',
            event = 'BufRead',
            config = function()
                require('mini.align').setup()
            end
        }

        use {
            'echasnovski/mini.comment',
            event = 'BufRead',
            config = function()
                require('mini.comment').setup()
            end
        }

        use {
            'echasnovski/mini.indentscope',
            event = 'BufRead',
            config = function()
                require('mini.indentscope').setup()
            end
        }

        use {
            'echasnovski/mini.pairs',
            event = 'BufRead',
            config = function()
                require('mini.pairs').setup()
            end
        }

        use {
            'echasnovski/mini.surround',
            event = 'BufRead',
            config = function()
                require('mini.surround').setup {
                    mappings = {
                        add = '<leader>sa',
                        delete = '<leader>sd',
                        find = '',
                        find_left = '',
                        highlight = '',
                        replace = '<leader>sr',
                        update_n_lines = '',
                    }
                }
            end
        }

        use {
            'kevinhwang91/nvim-bqf',
            event = 'BufRead'
        }

        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup()
            end
        }

        use {
            'ggandor/leap.nvim',
            event = 'BufRead',
            config = function()
                require('leap').add_default_mappings()
            end
        }

        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("catppuccin").setup {
                    flavour = "frappe",
                    background = {
                        light = 'latte',
                        dark = 'frappe',
                    },
                    integrations = {
                        aerial = true,
                        gitsigns = true,
                        leap = true,
                        cmp = true,
                        treesitter = true,
                        ts_rainbow = true,
                    }
                }
                vim.api.nvim_command "colorscheme catppuccin"
            end
        }

        use {
            'strash/everybody-wants-that-line.nvim',
            config = function()
                require('everybody-wants-that-line').setup {
                    buffer = {
                        max_symbols = 0,
                    },
                }
            end
        }

        use {
            'karb94/neoscroll.nvim',
            event = 'BufRead',
            config = function()
                require('neoscroll').setup()
            end
        }

        use {
            'stevearc/aerial.nvim',
            event = 'BufRead',
            config = function()
                require('aerial').setup()
            end
        }

        use {
            'NvChad/nvim-colorizer.lua',
            event = 'BufRead',
            config = function()
                require'colorizer'.setup()
            end
        }

        use {
            'beauwilliams/focus.nvim',
            event = 'BufRead',
            config = function()
                require("focus").setup {
                    cursorline = false,
                }
            end
        }

        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('gitsigns').setup {
                    signs = {
                        add = {text = '▍'},
                        change = {text = '▍'},
                        delete = {text = '▁'},
                        topdelete = {text = '▔'},
                        changedelete = {text = '█'},
                    },
                    current_line_blame = true,
                }
            end
        }

        use {
            'chentoast/marks.nvim',
            event = 'BufRead',
            config = function()
                require('marks').setup {
                    default_mappings = true,
                    signs = true,
                    mappings = {}
                }
            end
        }

        use 'elihunter173/dirbuf.nvim'

    end,

    config = {
        git = {
            clone_timeout = 600
        },
        display = {
            open_fn = function()
            return require('packer.util').float{ border = "single" }
            end,
            prompt_border = "single",
        },
        profile = {
            enable = true
        }
    }
}
