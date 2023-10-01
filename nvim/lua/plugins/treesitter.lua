local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    "RRethy/nvim-treesitter-textsubjects",
  },
  build = ":TSUpdate",
  event = "BufReadPost",
  keys = {
    {
      "<leader>sn",
      "<cmd>TSTextobjectSwapNext @parameter.inner<cr>"
    },
    {
      "<leader>sp",
      "<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>"
    },
    {
      "<leader>c",
      function()
        if pcall(vim.treesitter.get_parser, 0) then
          local playground = require 'nvim-treesitter-playground.hl-info'
          playground.show_hl_captures()
        end

        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local synstack = vim.fn.synstack(row, col + 1)
        local groups = vim.fn.map(synstack, 'synIDattr(v:val, "name")')
        print(vim.inspect(groups))

        local syntax = vim.fn.synID(row, col + 1, 1)
        local target = vim.fn.synIDtrans(syntax)
        if syntax ~= 0 then
          vim.cmd('hi '..vim.fn.synIDattr(syntax, 'name'))
        end
        if target ~= 0 then
          vim.cmd('hi '..vim.fn.synIDattr(target, 'name'))
        end
      end
    }
  }
}

function M.config()
  local treesitter = require('nvim-treesitter.configs')
  treesitter.setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
      disable = {'bash', 'css', 'latex', 'make'}
    },
    indent = {
      enable = true,
      disable = {'rust', 'latex'}
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
      }
    },
  }
end

return M