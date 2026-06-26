local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
  },
  event = "BufReadPost",
  keys = {
    {
      "<leader>c",
      "<cmd>Inspect<cr>",
      desc = "Inspect Treesitter Capture / Syntax highlight"
    },
    {
      "<leader>ci",
      "<cmd>InspectTree<cr>",
      desc = "Inspect Treesitter AST Tree"
    }
  }
}

function M.config()
  -- Setup nvim-treesitter core
  require("nvim-treesitter").setup()

  -- Setup nvim-treesitter-textobjects separately
  require("nvim-treesitter-textobjects").setup({
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sn"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sp"] = "@parameter.inner",
      },
    }
  })
end

return M
