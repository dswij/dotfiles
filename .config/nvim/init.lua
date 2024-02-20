-- set leader on top before bootstrap due to `lazy`
vim.g.mapleader = " "
vim.wo.relativenumber = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 24-bit color
vim.opt.termguicolors = true

require("bootstrap")
