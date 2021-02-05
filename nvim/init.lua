local g   = vim.g
local opt = vim.o
local bo  = vim.bo
local wo  = vim.wo
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

g.mapleader = ','
g.undodir = vim.fn.stdpath'cache'..'/undodir'
g.python3_host_prog = '/usr/bin/python3'
opt.compatible = false

require 'plugins'   -- located ~/.config/nvim/lua/plugins.lua
require 'mappings'  -- located ~/.config/nvim/lua/mappings.lua

-- FEATURES
wo.foldmethod = 'expr'
wo.foldlevel = 99
wo.foldexpr = 'nvim_treesitter#foldexpr()'
opt.path = opt.path..'**'
opt.splitright = true
opt.completeopt = 'menuone,noinsert,noselect'
opt.shortmess = opt.shortmess..'c'

-- INDENTS
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.undofile = true
opt.spelllang = 'en_us,cjk'
opt.formatoptions = opt.formatoptions..'nBj'

bo.expandtab = true
bo.shiftwidth = 4
bo.softtabstop = 4
bo.tabstop = 4
bo.undofile = true
bo.spelllang = 'en_us,cjk'
bo.formatoptions = bo.formatoptions..'nBj'

-- SEARCHING
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- LOOKINGS
wo.list = true
wo.number = true
wo.relativenumber = true
wo.cursorline = true
opt.listchars = opt.listchars..',tab:» ,trail:·'
opt.termguicolors = true
opt.background = 'dark'
opt.showmode = false
opt.scrolloff = 8

-- AUTOCMDS
cmd 'autocmd FileType gitcommit setlocal spell tw=72 fo+=t'
cmd 'autocmd FileType markdown  setlocal spell sw=2 ts=2 sts=2 cms=<!--%s-->'
cmd 'autocmd FileType gnuplot   setlocal cms=#%s'
cmd 'autocmd BufWritePost plugins.lua luafile %:p'
cmd 'autocmd BufWritePost plugins.lua PackerCompile'
