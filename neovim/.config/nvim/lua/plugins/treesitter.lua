require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "yaml",
        "json",
        "markdown",
        "latex",
        "ledger",
        "html",
        "css",
        "javascript",
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
    },
})
require"nvim-treesitter.install".compilers = { "clang", "gcc" }
require"nvim-treesitter.install".prefer_git = true
