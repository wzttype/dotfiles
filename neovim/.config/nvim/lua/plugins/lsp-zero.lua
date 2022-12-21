require("lsp-zero").preset("recommended")
require("lsp-zero").ensure_installed({
    "sumneko_lua",
    "emmet_ls",
    "tsserver",
    "pyright",
})
require("lsp-zero").setup()
