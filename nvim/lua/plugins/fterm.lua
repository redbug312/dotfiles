local M = {
  "numtostr/FTerm.nvim",
  keys = {
    {
      "<f5>",
      function()
        require'FTerm'.scratch {
          cmd = 'make build'
        }
      end
    },
    {
      "<f6>",
      function()
        require'FTerm'.scratch {
          cmd = 'make start'
        }
      end
    },
    {
      "<f7>",
      function()
        require'FTerm'.scratch {
          cmd = 'make debug'
        }
      end
    },
    {
      "<f8>",
      function()
        require'FTerm'.scratch {
          cmd = 'make check'
        }
      end
    },
    {
      "<f9>",
      function()
        require'FTerm'.toggle()
      end,
      mode = { "n", "t" }
    },
  },
  config = {
    border = 'single',
    dimensions = {
      height = 0.9,
      width = 0.7
    }
  }
}

return M
