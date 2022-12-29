require("gitsigns").setup({
    signcolumn = false,
    numhl = true,
    current_line_blame = true,
})
vim.api.nvim_set_keymap("n", "<leader>gv", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
