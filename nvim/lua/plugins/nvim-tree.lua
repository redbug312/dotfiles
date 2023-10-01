local M = {
  "kyazdani42/nvim-tree.lua",
  keys = {
    {
      "<leader>yh",
      function()
        require('nvim-tree').toggle()
      end,
      desc = "NvimTree",
    },
  },
  config = {
    update_cwd = true,
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = '',
          symlink = '',
          git = {
            unstaged  = '△',
            staged    = '✓',
            unmerged  = '!',
            renamed   = '-',
            untracked = '+',
            deleted   = '×',
            ignored   = '~',
          },
          folder = {
            arrow_closed = '▶',
            arrow_open   = '▼',
            default      = '▶',
            open         = '▼',
            empty        = '▷',
            empty_open   = '▽',
          }
        }
      }
    }
  },
}

return M
