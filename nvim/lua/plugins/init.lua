return {
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround", event = "VeryLazy" },

  { "christoomey/vim-sort-motion", keys = "gs" },
  { "wakatime/vim-wakatime", event = "BufReadPre" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },

  {
    'folke/which-key.nvim',
    config = true,
  },

  {
    "junegunn/vim-easy-align",
    keys = "ga",
    config = function()
      vim.keymap.set('n', 'ga', '<plug>(EasyAlign)', {remap = true})
      vim.keymap.set('v', 'ga', '<plug>(EasyAlign)', {remap = true})
    end,
  },

  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_new_list_item_indent = 0
    end,
  },

  {
    "terrortylor/nvim-comment",
    event = "BufReadPost",
    config = function()
      require("nvim_comment").setup()
    end,
  },

  {
    dir = vim.fn.stdpath("config").."/cactusbuddy",
    lazy = false,
    priority = 1000,
    dependencies = {
      "tjdevries/colorbuddy.vim",
      "tjdevries/express_line.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local colorbuddy = require("colorbuddy")
      vim.g.cactusbuddy_express_line_enabled = true
      colorbuddy.colorscheme("cactusbuddy")
    end,
  },
}
