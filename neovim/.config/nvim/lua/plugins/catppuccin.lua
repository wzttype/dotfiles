require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        aerial = true,
        gitsigns = true,
        cmp = true,
        treesitter = true,
        ts_rainbow = true,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
