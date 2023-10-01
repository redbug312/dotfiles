local indent = 4

-- FEATURES
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.path:append('**')
vim.opt.splitright = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess:append('c')
vim.opt.backspace:append('nostop')
vim.opt.mouse = ''

vim.opt.compatible = false
vim.opt.formatprg = 'par -w 80'

-- INDENTS
vim.opt.expandtab = true
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.tabstop = indent
vim.opt.spelllang = 'en_us,cjk'
vim.opt.formatoptions = 'tcqjnB'
vim.opt.textwidth = 80

-- SEARCHING
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- LOOKINGS
vim.opt.list = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '81,82'
vim.opt.listchars:append('tab:» ')
vim.opt.listchars:append('trail:·')
vim.opt.fillchars = 'fold:╴'
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.showmode = false
vim.opt.scrolloff = 3
vim.opt.showtabline = 0
