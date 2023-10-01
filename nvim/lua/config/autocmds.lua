vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "gitcommit",
  },
  callback = function()
    vim.o.textwidth = 72
    vim.wo.colorcolumn = '73,74'
    vim.wo.spell = true
  end
})

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "javascript",
    "lua",
    "markdown",
    "tex",
    "yaml",
  },
  callback = function()
    vim.o.shiftwidth = 2
    vim.o.softtabstop = 2
    vim.o.tabstop = 2
  end
})
