local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "windwp/nvim-autopairs",
  }
}

function M.config()
  local cmp = require('cmp')
  local autopairs = require('nvim-autopairs')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  autopairs.setup()
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  cmp.setup {
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    completion = {
      keyword_length = 3,
    },
    sources = {
      { name = 'nvim_lsp', max_item_count = 3 },
      { name = 'path', max_item_count = 3 },
      { name = 'buffer', max_item_count = 3 },
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
  }
  -- capabilities = require('cmp_nvim_lsp').default_capabilities()
end

return M
