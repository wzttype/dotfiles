require("treesj").setup({
    use_default_keymaps = false
})
vim.keymap.set("n", "<leader>t", vim.cmd.TSJToggle)
