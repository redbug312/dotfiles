local opt = vim.o
local cmd = vim.cmd

vim.g.python3_host_prog = '/usr/bin/python3'

require 'plugins'  -- lua/plugins.lua

vim.cmd 'source ~/.config/nvim/config/mappings.vim'
vim.cmd 'source ~/.config/nvim/legacy.vim'

vim.cmd('source '..vim.fn.stdpath('config')..'/overrides.vim')
vim.cmd 'colorscheme plain'
