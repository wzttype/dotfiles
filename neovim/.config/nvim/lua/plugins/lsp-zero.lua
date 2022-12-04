require("lsp-zero").preset("recommended")
require("lsp-zero").ensure_installed({
    "sumneko_lua",
    "marksman",
})
require("lsp-zero").setup()
