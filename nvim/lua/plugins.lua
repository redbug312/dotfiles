local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  cmd 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- SELF-CONTAINED
  use {'wbthomason/packer.nvim', opt = true}

  -- STILL IN EXPERIMENT
  -- notice if any plugin make intro disappeared
  use {'tjdevries/train.nvim'}
  use {'tweekmonster/startuptime.vim'}
  use {'steelsojka/pears.nvim',
    config = function()
      require('pears').setup()
    end
  }
  -- use {'voldikss/vim-floaterm',
  --   config = function()
  --     vim.g.floaterm_title = '─ $1/$2 '
  --     vim.g.floaterm_width = 0.6
  --     vim.g.floaterm_height = 0.9
  --   end
  -- }
  use {'numtostr/FTerm.nvim',
    config = function()
      local fterm = require 'FTerm'
      fterm.setup {
        dimensions = { height = 0.9, width = 0.6 },
        border = 'single'
      }
    end
  }
  -- use {'terrortylor/nvim-comment'}
  -- use {'b3nj5m1n/kommentary'}
  use {'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
  -- use {'tjdevries/express_line.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  --   config = function()
  --     local generator = function()
  --       local segments = {}
  --       local extensions = require('el.extensions')
  --       table.insert(segments, extensions.mode)
  --       table.insert(segments, ' ')
  --       local builtin = require('el.builtin')
  --       table.insert(segments, builtin.tail_file)
  --       table.insert(segments, ' ')
  --       table.insert(segments, builtin.modified_flag)
  --       local sections = require('el.sections')
  --       table.insert(segments, sections.split)
  --       local subscribe = require('el.subscribe')
  --       -- table.insert(segments,
  --       --   subscribe.buf_autocmd(
  --       --     "el_git_branch",
  --       --     "BufEnter",
  --       --     function(window, buffer)
  --       --       return ' '..extensions.git_branch(window, buffer)..'  '
  --       --     end
  --       -- ))
  --       local filetype = function(window, buffer)
  --         return builtin.filetype_list(window, buffer)..'  '
  --       end
  --       table.insert(segments, builtin.filetype_list)
  --       table.insert(segments, '  ')
  --       table.insert(segments, builtin.percentage_through_file)
  --       table.insert(segments, '%%')
  --       return segments
  --     end
  --     require('el').setup { generator = generator }
  --   end
  -- }
  -- use {'lukas-reineke/indent-blankline.nvim',
  --   branch = 'lua',
  --   config = function()
  --     vim.g.indent_blankline_char = '│'
  --   end
  -- }
  -- use {'hrsh7th/nvim-compe',
  --   config = function()
  --     local compe = require 'compe'
  --     compe.setup { enabled = true }
  --   end
  -- }

  -- TREE-SITTER
  use {'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    config = function() require 'treesitter' end
  }

  use {'plasticboy/vim-markdown',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_new_list_item_indent = 0
    end
  }

  -- LANGUAGE-SERVER
  use {'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/completion-nvim',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function()
      local lsp = require 'lspconfig'
      local on_attach = require'completion'.on_attach
      lsp.rust_analyzer.setup { on_attach = on_attach }
      lsp.pyls.setup { on_attach = on_attach }

      vim.cmd(
        "autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs "..
        ":lua require'lsp_extensions'.inlay_hints{"..
        "  prefix = ' » ', highlight = 'NonText',"..
        "  enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'}"..
        "}"
      )

      vim.g.completion_trigger_keyword_length = 3
      vim.cmd 'autocmd BufEnter * lua require"completion".on_attach()'
    end
  }

  -- TELESCOPE
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
    config = function()
      require'telescope'.load_extension'project'
    end,
  }

  -- COLORSCHEME
  use {'tjdevries/gruvbuddy.nvim',
    requires = 'tjdevries/colorbuddy.vim'
  }
  use {'/home/redbug312/.config/nvim/cactusbuddy',
    requires = {'tjdevries/colorbuddy.vim', 'glepnir/galaxyline.nvim'},
    config = function()
      vim.g.cactusbuddy_galaxyline_enabled = true
      require('colorbuddy').colorscheme('cactusbuddy')
    end
  }

  -- BRACKET-MATCHING
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  -- use 'cohama/lexima.vim'

  -- MOTION & OBJECTS
  -- use 'tpope/vim-commentary'         -- gc
  use 'christoomey/vim-sort-motion'  -- gs
  use 'junegunn/vim-easy-align'      -- ga

  -- TAGS-GENERATION
  use {'ludovicchabant/vim-gutentags',
    config = function()
      vim.g.gutentags_project_root = {'.tags'}
      vim.g.gutentags_ctags_tagfile = '.tags'
      vim.g.gutentags_file_list_command = {
        markers = { ['.git'] = 'git ls-files', ['.hg']  = 'hg files' }
      }
    end
  }

  -- MISCELLANEOUS
  use 'wakatime/vim-wakatime'
  use 'derekwyatt/vim-fswitch'

  -- USER-INTERFACE
  use 'kshenoy/vim-signature'

  use {'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup {
      signs = {
        add          = { hl = 'LineNr' },
        change       = { hl = 'LineNr' },
        delete       = { hl = 'LineNr', text = '═' },
        topdelete    = { hl = 'LineNr', text = '╤' },
        changedelete = { hl = 'LineNr', text = '╧' },
      },
    } end
  }

  use {'kyazdani42/nvim-tree.lua',
    config = function()
      vim.g.nvim_tree_icons = {
        git = {
          unstaged  = '(△)',
          staged    = '(✓)',
          unmerged  = '(!)',
          renamed   = '(-)',
          untracked = '(+)',
          deleted   = '(×)',
          ignored   = '(~)',
        },
        folder = {
          default    = '▶',
          open       = '▼',
          empty      = '▷',
          empty_open = '▽',
        }
      }
    end
  }

  use {'majutsushi/tagbar',
    requires = 'lvht/tagbar-markdown',
    config = function()
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_sort = 0
    end
  }

end)
