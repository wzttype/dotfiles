require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        dashboard = false,
        nvimtree = false,
        telescope = false,
        indent_blankline = false,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
