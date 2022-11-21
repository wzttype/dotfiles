-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- Highlight on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "1000" })
  end
})

-- Remove whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e"
})

-- Automatically run PackerSync on save of plugins.lua
local sync_packer = function()
    vim.cmd("runtime lua/plugins.lua")
    require("packer").sync()
end
vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    {
        pattern = { "plugins.lua" },
        callback = sync_packer,
    })
