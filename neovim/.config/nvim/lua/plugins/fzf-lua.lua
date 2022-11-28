require("fzf-lua").setup({
    winopts = {
        border = "single",
        preview = {
            border = "noborder"
        }
    }
})
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>FzfLua<CR>", { noremap = true, silent = true })
