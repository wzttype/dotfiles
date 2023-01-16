require("svart").configure({
  ui_dim_content = false,
})
vim.keymap.set("n", "s", vim.cmd.Svart)
vim.keymap.set("n", "S", vim.cmd.SvartRepeat)
