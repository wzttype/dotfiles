require("gitsigns").setup({
  signcolumn = false,
  numhl = true,
  current_line_blame = true,
})
vim.keymap.set("n", "<leader>gv", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>")
