vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.exrc = false
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.modelines = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.shortmess:append("csI")
vim.opt.showbreak = "> "
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.switchbuf = "useopen"
vim.opt.tabstop = 4
vim.opt.tagcase = "followscs"
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250
vim.opt.writebackup = false

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
    "matchparen",
    "man"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
