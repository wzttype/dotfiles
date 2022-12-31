require("lsp-zero").ensure_installed({
    "sumneko_lua",
    "emmet_ls",
    "tsserver",
    "eslint",
    "pyright",
})
require("lsp-zero").preset("recommended")
require("lsp-zero").configure("sumneko_lua",{
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
require("lsp-zero").set_preferences({
    sign_icons = { }
})
require("lsp-zero").setup()
