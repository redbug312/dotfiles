require 'nvim-treesitter.configs'.setup {
  -- nvim-treesitter
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    disable = {'bash', 'rust'}
  },
  indent = {
    enable = true,
    disable = {'rust'}
  },

  -- nvim-treesitter-refactor
  refactor = {
    highlight_definitions = {
      enable = false
    },
    highlight_current_scope = {
      enable = false
    },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = 'grr' }
    },
    navigation = {
      enable = true,
      keymaps = { goto_definition = 'gnd', list_definitions = 'gnD' }
    },
  },

  -- nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ae'] = '@block.outer',
        ['ie'] = '@block.inner',
        ['as'] = '@statement.outer',
        ['is'] = '@statement.inner',
        ['am'] = '@call.outer',       -- method
        ['im'] = '@call.inner',       -- method
        ['aa'] = '@parameter.outer',  -- argument
        ['ia'] = '@parameter.inner',  -- argument
      }
    },
  },
}
