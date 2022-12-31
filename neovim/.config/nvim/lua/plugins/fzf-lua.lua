require("fzf-lua").setup({
    winopts = {
        border = "single",
        preview = {
            border = "noborder"
        }
    }
})
vim.keymap.set("n", "<leader>ff", ":lua require('fzf-lua').files()<CR>")
vim.keymap.set("n", "<leader>fb", ":lua require('fzf-lua').buffers()<CR>")
vim.keymap.set("n", "<leader>fg", ":lua require('fzf-lua').live_grep()<CR>")
