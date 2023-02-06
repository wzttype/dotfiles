require("oil").setup({
  columns = { "" },
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
