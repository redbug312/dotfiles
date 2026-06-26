return {
  { "tpope/vim-fugitive", cmd = "Git" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround", event = "VeryLazy" },

  { "Eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },

  { "christoomey/vim-sort-motion", keys = "gs" },
  { "wakatime/vim-wakatime", event = "BufReadPre" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },

  { "chrisgrieser/nvim-early-retirement", config = true, event = "VeryLazy" },

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
    "mceazy2700/antigravity-cli.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- terminal = {
      --   provider = "float", 
      --   float_opts = {
      --     width = 0.8,
      --     height = 0.8,
      --     border = "rounded",
      --   },
      -- },
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Antigravity" },
      { "<leader>ac", "<cmd>Antigravity<cr>", desc = "Toggle Antigravity" },
      { "<leader>aa", "<cmd>AntigravityAsk<cr>", desc = "Ask Antigravity", mode = { "n", "v" } },
      {
        "<leader>ab",
        function()
          require("antigravity-cli.integrations").add_to_context(vim.api.nvim_buf_get_name(0))
        end,
        desc = "Add current buffer to Antigravity context",
      },
    },
  },

  {
    dir = vim.fn.stdpath("config").."/cactusbuddy",
    lazy = false,
    priority = 1000,
    dependencies = {
      "tjdevries/colorbuddy.vim",
      "rebelot/heirline.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local colorbuddy = require("colorbuddy")
      vim.g.cactusbuddy_heirline_enabled = true
      colorbuddy.colorscheme("cactusbuddy")
    end,
  },
}
