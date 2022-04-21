local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
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

        use 'nathom/filetype.nvim'

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
                        "bash",
                        "fish",
                        "lua",
                        "yaml",
                        "json",
                        "vim",
                        "markdown",
                        "latex",
                        "ledger",
                    },
                    highlight = {
                        enable = true,
                        use_languages = true,
                        additional_vim_regex_highlighting = true,
                    },
                }
                require'nvim-treesitter.install'.compilers = { "clang", "gcc" }
                require'nvim-treesitter.install'.prefer_git = true
            end
        }

        use {
            'jose-elias-alvarez/null-ls.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            event = 'BufRead',
            config = function()
                require("null-ls").setup {
                    sources = {
                        require("null-ls").builtins.code_actions.gitsigns,
                    },
                }
            end
        }

        use 'ibhagwan/fzf-lua'

        use {
            'echasnovski/mini.nvim',
            event = 'BufRead',
            config = function()
                require('mini.comment').setup()
                require('mini.indentscope').setup()
                require('mini.trailspace').setup()
            end
        }

        use {
            'nyngwang/NeoRoot.lua',
            config = function()
                require('neo-root').setup {
                    CUR_MODE = 2
                }
            end
        }

        use 'ggandor/lightspeed.nvim'

        use {
            'EdenEast/nightfox.nvim',
            config = function()
                require('nightfox').setup {
                    options = {
                        styles = {
                            comments = "italic",
                            keywords = "bold",
                            functions = "italic,bold",
                        },
                        inverse = {
                            match_paren = true,
                            visual = true,
                            search = true,
                        },
                    }
                }
            end
        }
        vim.cmd("colorscheme nightfox")

        use {
            'kevinhwang91/nvim-bqf',
            event = 'BufRead',
            ft = 'qf',
            config = function()
                require('bqf').setup()
            end
        }

        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require('lualine').setup {
                    options = {
                        globalstatus = true,
                        icons_enabled = false,
                        theme = 'palenight'
                    }
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
            'norcalli/nvim-colorizer.lua',
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
            requires = { 'nvim-lua/plenary.nvim' },
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
            'chentau/marks.nvim',
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

        use {
            'luukvbaal/stabilize.nvim',
            config = function()
                require("stabilize").setup()
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
