local g   = vim.g
local opt = vim.o
local cmd = vim.cmd

g.mapleader = ','
g.undodir = vim.fn.stdpath('cache')..'/undodir'
g.python3_host_prog = '/usr/bin/python3'
opt.compatible = false

g.tex_flavor = 'latex'
opt.formatprg = 'par -w 80'

require 'plugins'   -- located ~/.config/nvim/lua/plugins.lua
require 'mappings'  -- located ~/.config/nvim/lua/mappings.lua

-- FEATURES
opt.foldmethod = 'expr'
opt.foldlevel = 99
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.path = opt.path..'**'
opt.splitright = true
opt.completeopt = 'menuone,noinsert,noselect'
opt.shortmess = opt.shortmess..'c'
opt.backspace = opt.backspace..',nostop'
opt.mouse = ''

-- INDENTS
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.spelllang = 'en_us,cjk'
opt.formatoptions = 'tcqjnB'
opt.textwidth = 80

-- SEARCHING
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- LOOKINGS
opt.list = true
opt.number = true
opt.cursorline = true
opt.colorcolumn = '81,82'
opt.listchars = opt.listchars..',tab:» ,trail:·'
opt.fillchars = 'fold:╴'
opt.termguicolors = true
opt.background = 'dark'
opt.showmode = false
opt.scrolloff = 3
opt.showtabline = 0

-- AUTOCMDS
cmd 'autocmd BufWritePost plugins.lua source %:p | PackerCompile'
-- cmd 'autocmd BufWritePost plugins.lua luafile %:p'
cmd 'autocmd FileType gitcommit  setlocal spell tw=72 fo+=t'
cmd 'autocmd FileType gnuplot    setlocal cms=#%s'
cmd 'autocmd FileType javascript setlocal sw=2 ts=2 sts=2'
cmd 'autocmd FileType lua        setlocal sw=2 ts=2 sts=2'
cmd 'autocmd FileType markdown   setlocal sw=2 ts=2 sts=2 cms=<!--%s-->'
cmd 'autocmd FileType pug        setlocal sw=2 ts=2 sts=2'
cmd 'autocmd FileType tex        setlocal sw=2 ts=2 sts=2 tw=80 fo+=t'
cmd 'autocmd FileType toml       setlocal cms=#%s'
cmd 'autocmd FileType yaml       setlocal sw=2 ts=2 sts=2'
