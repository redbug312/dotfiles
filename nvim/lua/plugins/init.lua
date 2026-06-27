return {
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  { "tpope/vim-fugitive", cmd = "Git" },

  { "chrisgrieser/nvim-early-retirement", event = "VeryLazy" },
  { "echasnovski/mini.align", event = "VeryLazy", config = true },
  { "echasnovski/mini.operators", event = "VeryLazy", config = true },
  { "echasnovski/mini.pairs", event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "wakatime/vim-wakatime", event = "BufReadPre" },

  {
    "mceazy2700/antigravity-cli.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
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
      "echasnovski/mini.base16",
      "echasnovski/mini.statusline",
    },
    config = function()
      vim.cmd("colorscheme cactusbuddy")
    end,
  },
}
