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
            end
        }

        use {
            'echasnovski/mini.nvim',
            event = 'BufRead',
            config = function()
                require('mini.comment').setup()
                require('mini.indentscope').setup()
                require('mini.pairs').setup()
                require('mini.surround').setup {
                    custom_surroundings = {
                        ['('] = { output = { left = '( ', right = ' )' } },
                        ['['] = { output = { left = '[ ', right = ' ]' } },
                        ['{'] = { output = { left = '{ ', right = ' }' } },
                        ['<'] = { output = { left = '< ', right = ' >' } },
                    },
                    mappings = {
                        add = 'ys',
                        delete = 'ds',
                        find = '',
                        find_left = '',
                        highlight = '',
                        replace = 'cs',
                        update_n_lines = '',
                    },
                    search_method = 'cover_or_next',
                }
                vim.api.nvim_del_keymap('x', 'ys')
                vim.api.nvim_set_keymap('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
                vim.api.nvim_set_keymap('n', 'yss', 'ys_', { noremap = false })
            end
        }

        use 'kevinhwang91/nvim-bqf'

        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup()
            end
        }

        use {
            'ggandor/leap.nvim',
            config = function()
                require('leap').add_default_mappings()
            end
        }

        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                vim.g.catppuccin_flavour = "frappe"  -- latte, mocha, frappe, macchiato
                require("catppuccin").setup {
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
                    filepath = {
                        shorten = true,
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
            config = function()
                require'marks'.setup {
                    default_mappings = true,
                    builtin_marks = { ".", "<", ">", "^" },
                    cyclic = true,
                    force_write_shada = false,
                    refresh_interval = 250,
                    sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
                    bookmark_0 = {
                        sign = "⚑",
                        virt_text = "hello world"
                    },
                    mappings = {}
                }
            end
        }

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
