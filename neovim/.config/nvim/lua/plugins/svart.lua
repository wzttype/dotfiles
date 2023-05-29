require("svart").configure({
  ui_dim_content = false,
})
vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>Svart<CR>")
