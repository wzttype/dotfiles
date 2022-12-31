require("catppuccin").setup({
    flavour = "frappe",
    integrations = {
        dashboard = false,
        nvimtree = false,
        telescope = false,
        indent_blankline = false,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
