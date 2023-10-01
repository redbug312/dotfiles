local M = {
  "stevearc/aerial.nvim",
  keys = {
    {
      "<leader>yl",
      function()
        require'aerial'.toggle()
      end
    },
    {
      "[s",
      function()
        require'aerial'.next(-1)
      end
    },
    {
      "]s",
      function()
        require'aerial'.next(1)
      end
    },
  },
  config = {
    manage_folds = true,
    layout = {
      max_width = 30,
      min_width = 30,
      default_direction = 'right',
      placement = 'edge',
    },
    filter_kind = {
      'Class',
      'Constructor',
      'Enum',
      'Field',
      'Function',
      'Interface',
      'Method',
      'Module',
      'Struct',
    },
    icons = {
      Collapsed = ' ▷',
      Class = 'ᴄʟ',
      Enum = 'ᴇᴍ',
      Field = 'ꜰᴅ',
      Function = 'ꜰɴ',
      Interface = 'ɪꜰ',
      Method = 'ᴍᴛ',
      Module = 'ᴍᴅ',
      Struct = 'ꜱᴛ',
    }
  }
}

return M
