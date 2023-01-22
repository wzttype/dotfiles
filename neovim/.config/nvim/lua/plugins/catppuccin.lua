require("catppuccin").setup({
  flavour = "frappe",
  background = {
    light = "latte",
    dark = "frappe",
  },
  integrations = {
    gitsigns = true,
    mason = true,
    mini = true,
    cmp = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
})
vim.api.nvim_command("colorscheme catppuccin")
