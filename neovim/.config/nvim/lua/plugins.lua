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
            'nvim-treesitter/playground',
            after = { 'nvim-treesitter' },
            cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
            config = function()
                require'nvim-treesitter.configs'.setup {
                    playground = {
                        enable = true,
                    },
                    query_linter = {
                        enable = true,
                        use_virtual_text = true,
                        lint_events = { "BufWrite", "CursorHold", "CursorMoved" },
                    },
                }
            end
        }

        use {
            'stevearc/aerial.nvim',
            config = function()
                require('telescope').load_extension('aerial')
            end
        }

        use {
            'monkoose/matchparen.nvim',
            config = function()
                require('matchparen').setup()
            end
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        use {
            'ahmedkhalf/project.nvim',
            config = function()
                require("project_nvim").setup {
                    show_hidden = true,
                    silent_chdir = true,
                }
                require('telescope').load_extension('projects')
            end
        }

        use {
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup {
                    check_ts = true,
                    ts_config = {
                        lua = { "string", "source" },
                        javascript = { "string", "template_string" },
                        java = false,
                    },
                    enable_check_bracket_line = false,
                    ignored_next_char = "[%w%.]",
                    enable_afterquote = false,
                }
            end
        }

        use {
            'EdenEast/nightfox.nvim',
            config = function()
                require('nightfox').setup {
                    fox = "nightfox",
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
                require('nightfox').load()
            end
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            event = "BufRead",
            config = function()
                require("indent_blankline").setup {
                    filetype_exclude = {
                        "help",
                        "vimwiki",
                        "man",
                        "gitmessengerpopup",
                        "diagnosticpopup",
                        "lspinfo",
                        "packer",
                        "Trouble",
                        "TelescopePrompt",
                        "TelescopeResults",
                    },
                    buftype_exclude = { "terminal" },
                    space_char_blankline = " ",
                    show_foldtext = false,
                    strict_tabs = true,
                    debug = true,
                    disable_with_nolist = true,
                    max_indent_increase = 1,
                    show_current_context = true,
                    context_patterns = {
                        "class",
                        "function",
                        "method",
                        "^if",
                        "while",
                        "for",
                        "with",
                        "func_literal",
                        "block",
                        "try",
                        "except",
                        "argument_list",
                        "object",
                        "dictionary",
                        "element",
                    },
                }
            end
        }

        use {
            'https://gitlab.com/yorickpeterse/nvim-dd.git',
            config = function()
                require('dd').setup()
            end
        }

        use {
            'karb94/neoscroll.nvim',
            config = function()
                require('neoscroll').setup()
            end
        }

        use {
            'norcalli/nvim-colorizer.lua',
            event = "BufRead",
            config = function()
                require'colorizer'.setup()
            end
        }

        use {
            'lewis6991/gitsigns.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            },
            event = "BufRead",
            config = function()
                require('gitsigns').setup {
                    current_line_blame = true,
                }
            end
        }

        use {
            'jose-elias-alvarez/null-ls.nvim',
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("null-ls").setup {
                    sources = {
                        require("null-ls").builtins.code_actions.gitsigns,
                        -- require("null-ls").builtins.formatting.stylua,
                        -- require("null-ls").builtins.diagnostics.eslint,
                        -- require("null-ls").builtins.completion.spell,
                    },
                }
            end
        }

        use {
            'famiu/feline.nvim',
            config = function()
                require('feline').setup {
                    preset = 'noicon'
                }
            end
        }

        use {
            'blackCauldron7/surround.nvim',
            config = function()
                require"surround".setup {
                    mappings_style = "surround"
                }
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
            'luukvbaal/stabilize.nvim',
            config = function()
                require("stabilize").setup()
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

        use 'ggandor/lightspeed.nvim'

        use {
            'numToStr/Comment.nvim',
            opt = true,
            keys = { "gc", "gcc" },
            config = function()
                require('Comment').setup()
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
