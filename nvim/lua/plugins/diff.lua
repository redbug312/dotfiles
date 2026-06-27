local M = {
  "echasnovski/mini.diff",
  version = "*",
  event = "BufReadPre",
  keys = {
    {
      "<f4>",
      function()
        require("mini.diff").toggle_overlay()
      end,
      desc = "Toggle diff overlay",
    },
    {
      "<leader>hs",
      function()
        require("mini.diff").do_hunk("stage")
      end,
      desc = "Stage hunk",
    },
    {
      "<leader>hr",
      function()
        require("mini.diff").do_hunk("reset")
      end,
      desc = "Reset hunk",
    },
    {
      "[h",
      function()
        require("mini.diff").goto_hunk("prev")
      end,
      desc = "Previous hunk",
    },
    {
      "]h",
      function()
        require("mini.diff").goto_hunk("next")
      end,
      desc = "Next hunk",
    },
  },
  opts = {
    view = {
      style = "sign",
      signs = {
        add = "│",
        change = "│",
        delete = "═",
      },
    },
  },
}

return M
