vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-Left>", "<cmd>bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<cmd>bnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
