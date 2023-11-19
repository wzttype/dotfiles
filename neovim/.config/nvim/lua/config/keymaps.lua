vim.keymap.set("n", "x", '"_x', { desc = "Delete character without copying it into register" })

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Better up" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Better down" })

vim.keymap.set("v", "<", "<gv", { desc = "Easy left indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Easy right indenting" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })

vim.keymap.set("n", "<A-Up>", ":resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", ":resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-h>", vim.cmd.bprevious, { desc = "Prev buffer" })
vim.keymap.set("n", "<A-l>", vim.cmd.bnext, { desc = "Next buffer" })

vim.keymap.set("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "properly indent on empty line when insert" })
