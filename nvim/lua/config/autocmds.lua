vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "gitcommit",
  },
  callback = function(event)
    vim.bo.textwidth = 72
    vim.bo.colorcolumn = '73,74'
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
  callback = function(event)
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
  end
})
