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
      "ledger",
    },
    sync_install = true,
    auto_install = false,
    highlight = {
      enable = true,
      use_languages = true,
      additional_vim_regex_highlighting = false,
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
