local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  keys = {
    {
      "<f3>",
      function()
        require'gitsigns'.blame_line()
      end,
      desc = "Run git blame on the current line"
    },
    {
      "<f4>",
      function()
        require'gitsigns'.preview_hunk()
      end,
      desc = "Preview the hunk at the cursor position"
    },
    {
      "<leader>hs",
      function()
        require'gitsigns'.stage_hunk()
      end,
    },
    {
      "<leader>hr",
      function()
        require'gitsigns'.reset_hunk()
      end,
    },
    {
      "<leader>hs",
      function()
        require'gitsigns'.undo_stage_hunk()
      end,
    },
    {
      "<leader>yb",
      function()
        require'gitsigns'.toggle_current_line_blame()
      end,
    },
    {
      "<leader>yg",
      function()
        require'gitsigns'.toggle_deleted()
      end,
    },
    {
      "[h",
      function()
        require'gitsigns'.prev_hunk()
      end,
    },
    {
      "]h",
      function()
        require'gitsigns'.next_hunk()
      end,
    },
  },
  config = {
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '═' },
      topdelete    = { text = '╤' },
      changedelete = { text = '╧' },
      untracked    = { text = '╎' },
    }
  }
}

return M
