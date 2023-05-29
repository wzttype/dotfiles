require("catppuccin").setup({
  flavour = "frappe",
  background = {
    light = "latte",
    dark = "frappe",
  },
  transparent_background = true,
  integrations = {
    gitsigns = true,
    mason = true,
    mini = true,
    cmp = true,
    native_lsp = {
      enabled = true,
    },
    treesitter = true,
  },
})
vim.cmd.colorscheme("catppuccin")
