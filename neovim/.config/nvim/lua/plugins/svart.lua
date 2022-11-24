require("svart").configure({
    ui_dim_content = false,
})
vim.api.nvim_set_keymap("n", "s", "<cmd>Svart<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "S", "<cmd>SvartRegex<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>SvartRepeat<CR>", { noremap = true, silent = true })
