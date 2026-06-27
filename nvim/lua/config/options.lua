local indent = 4

-- FEATURES
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.path:append('**')
vim.opt.splitright = true
vim.opt.completeopt = 'menu,menuone,popup'
vim.o.autocomplete = false
vim.opt.shortmess:append('c')
vim.opt.backspace:append('nostop')
vim.opt.mouse = ''

vim.opt.compatible = false
vim.opt.formatprg = 'par -w 72'

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

-- Disable autocomplete in Telescope prompt
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    vim.opt_local.autocomplete = false
  end,
})

-- Force Neovim terminal/shell to run as a login shell to inherit system profiles
if not string.find(vim.o.shell, "-l") then
  vim.o.shell = vim.o.shell .. " -l"
end

