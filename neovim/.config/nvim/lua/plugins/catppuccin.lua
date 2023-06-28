return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      background = {
        light = "latte",
        dark = "frappe",
      },
      integrations = {
        gitsigns = true,
        mason = true,
        indent_blankline = { enabled = true },
        mini = true,
        cmp = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        treesitter = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
