-- packer.nvim initialization
local execute = vim.api.nvim_command
local compile_suffix = "/plugin/packer_compiled.lua"
local install_suffix = "/site/pack/packer/%s/packer.nvim"
local install_path = vim.fn.stdpath("data") .. string.format(install_suffix, "opt")
local compile_path = vim.fn.stdpath("data") .. compile_suffix

-- check if packer is installed (~/.local/share/nvim/site/pack)
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0
local is_compiled = vim.fn.empty(vim.fn.glob(compile_path)) == 0
if not is_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
        print("Installed packer.nvim.")
        is_installed = 1
    end
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
    function()

        use {
            'wbthomason/packer.nvim',
            opt = true,
        }

        use{
            'nathom/filetype.nvim',
            config = function()
                -- Do not source the default filetype.vim, use this line before V0.6.0
                vim.g.did_load_filetypes = 1
            end
        }

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
                            init_selection = "gnn",
                            node_incremental = "gna",
                            -- scope_incremental = "gns",
                            node_decremental = "gnd",
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
            'andymass/vim-matchup',
            after = { 'nvim-treesitter' },
            config = function()
                require'nvim-treesitter.configs'.setup {
                    matchup = {
                        enable = true,
                    },
                }
            end
        }

        use {
            'ibhagwan/fzf-lua',
            requires = {'vijaymarupudi/nvim-fzf'}
        }

        use {
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup {
                    enable_check_bracket_line = false,
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
            'windwp/windline.nvim',
            config = function()
                require('wlsample.bubble')
            end
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            event = "BufRead",
            config = function()
                require("indent_blankline").setup {
                    filetype_exclude = {
                        "vimwiki",
                        "man",
                        "gitmessengerpopup",
                        "diagnosticpopup",
                        "lspinfo",
                        "packer",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "",
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

        -- wair for neovim 0.6.
        -- use {
        --     'https://gitlab.com/yorickpeterse/nvim-dd.git',
        --     config = function()
        --         require('dd').setup()
        --     end

        use {
            'karb94/neoscroll.nvim',
            config = function()
                require('neoscroll').setup()
            end
        }

        use {
            'norcalli/nvim-colorizer.lua',
            opt = true,
            cmd = {'ColorizerAttachToBuffer', 'ColorizerDetachFromBuffer' },
            config = function()
                require'colorizer'.setup()
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
            cmd = "FocusSplitNicely",
            module = "focus",
            config = function()
                require("focus").setup()
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

        use {
            'ggandor/lightspeed.nvim',
            config = function()
                require'lightspeed'.setup {
                    jump_to_first_match = false,
                }
            end
        }

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        use {
            'jakewvincent/mkdnflow.nvim',
            config = function()
                require('mkdnflow').setup({})
            end
        }

        use {
            'kristijanhusak/orgmode.nvim',
            config = function()
                require('orgmode').setup{}
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
