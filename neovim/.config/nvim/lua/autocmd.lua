-- remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {command = "%s/\\s\\+$//e"})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd(
    "BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        command = "silent! lua vim.highlight.on_yank()",
        group = yankGrp,
    })

-- automatically run PackerSync on save of plugins.lua
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
