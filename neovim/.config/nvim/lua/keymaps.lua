-- quick Esc
vim.keymap.set("i", "jk", "<ESC>")

-- delete character without copying it into register
vim.keymap.set("n", "x", '"_x')

-- better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- easy indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })

-- resize window using <ctrl> arrow keys
vim.keymap.set("n", "<A-Up>", ":resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", ":resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<cr>", { desc = "Increase window width" })

-- quick switch buffer
vim.keymap.set("n", "<A-h>", vim.cmd.bprevious, { desc = "Prev buffer" })
vim.keymap.set("n", "<A-l>", vim.cmd.bnext, { desc = "Next buffer" })
