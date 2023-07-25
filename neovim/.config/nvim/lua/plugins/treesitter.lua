return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "andymass/vim-matchup",
  },
  opts = {
    ensure_installed = {
      "lua",
      "python",
    },
    sync_install = true,
    auto_install = false,
    highlight = {
      enable = true,
      use_languages = true,
      additional_vim_regex_highlighting = false,
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
      enable = true,
    },
    -- vim-matchup
    matchup = {
      enable = true,
    },
  },
}
