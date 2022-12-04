require("gitsigns").setup({
    signcolumn = false,
    numhl = true,
    current_line_blame = true,
})
vim.api.nvim_set_keymap("n", "<leader>p", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
