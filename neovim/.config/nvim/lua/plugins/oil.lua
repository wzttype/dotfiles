require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<BS>", require("oil").open, { desc = "Open parent directory" })
