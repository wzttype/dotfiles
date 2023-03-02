require("lsp-zero").ensure_installed({
  "lua_ls",
  "emmet_ls",
  "tsserver",
  "pyright",
})
require("lsp-zero").preset({
  name = "minimal",
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})
require("lsp-zero").configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
require("lsp-zero").set_preferences({
  sign_icons = {},
})
require("lsp-zero").setup()
vim.diagnostic.config({
  signs = false,
})
