local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {'git', 'clone',
    'https://github.com/wbthomason/packer.nvim', install_path}
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()

  -- SELF-CONTAINED
  use 'wbthomason/packer.nvim'

  -- UNDER EXPERIMENT

  use {'digitaltoad/vim-pug'}

  use {'blackCauldron7/surround.nvim',
    config = function()
      local surround = require('surround')
      surround.setup {
        mappings_style = 'surround',
        pairs = {
          nestable = { {"(", ")"}, {"[", "]"}, {"{", "}"}, {"<", ">"} },
          linear = { {"'", "'"}, {'"', '"'} },
        }
      }
    end
  }

  use {'mfussenegger/nvim-dap',
    requires = {
      'nvim-telescope/telescope-dap.nvim',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      local pwd = function()
        return vim.fn.getcwd()
      end
      local dap = require('dap')
      dap.adapters.lldb = {
        name = 'lldb',
        type = 'executable',
        command = '/usr/bin/lldb-vscode-10',
      }
      dap.configurations.rust = {{
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = pwd()..'/target/debug/adams-leaf-nightly',
        -- cwd = '${workspaceFolder}',
        -- stopOnEntry = true,
      }}
      vim.fn.sign_define('DapBreakpoint', {
        text = '⚑',
        texthl = 'Title',
        numhl = 'Title',
      })
      vim.fn.sign_define('DapStopped', {
        text = '▶',
        texthl = 'Todo',
        numhl = 'Todo',
      })
    end
  }

  use {'terrortylor/nvim-comment',
    config = function()
      local comment = require('nvim_comment')
      comment.setup()
    end
  }

  use {'hrsh7th/nvim-compe',
    config = function()
      local compe = require('compe')
      compe.setup {
        source = {
          path = true,
          calc = true,
          nvim_lsp = true,
        }
      }
    end
  }

  use {'windwp/nvim-autopairs',
    requires = 'hrsh7th/nvim-compe',
    config = function()
      local npairs = require('nvim-autopairs')
      local npairs_compe = require('nvim-autopairs.completion.compe')
      npairs.setup()
      npairs_compe.setup {
        map_cr = true,
        map_complete = true,
        auto_select = false,
      }
    end
  }

  -- TREE-SITTER
  use {'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    requires = {
      -- 'nvim-treesitter/nvim-treesitter-refactor',
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'RRethy/nvim-treesitter-textsubjects',
    },
    config = function()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup {
        ensure_installed = 'maintained',
        highlight = {
          enable = true,
          disable = {'bash', 'rust', 'css'}
        },
        indent = {
          enable = true,
          disable = {'rust'}
        },
        textsubjects = {
          enable = true,
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
          }
        },
      }
    end
  }

  use {'plasticboy/vim-markdown',
    config = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_new_list_item_indent = 0
    end
  }

  -- LANGUAGE-SERVER
  use {'neovim/nvim-lspconfig',
    requires = {
      -- 'nvim-lua/completion-nvim',
      'nvim-lua/lsp_extensions.nvim',
      'stevearc/aerial.nvim',
    },
    config = function()
      local lsp = require('lspconfig')
      local aerial = require('aerial')
      local custom_attach = function(client)
        aerial.on_attach(client)
      end
      lsp.rust_analyzer.setup {
        on_attach = custom_attach,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              disabled = {
                "unresolved-extern-crate", -- rust-analyzer#6714
                "unresolved-proc-macro",   -- rust-analyzer#7497
                "inactive-code",
              },
            },
          }
        }
      }
      lsp.pylsp.setup {
        on_attach = custom_attach
      }
      vim.cmd(
        "autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs "..
        ":lua require'lsp_extensions'.inlay_hints {"..
        "  prefix = ' » ', highlight = 'NonText',"..
        "  enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'}"..
        "}"
      )
    end
  }

  -- TELESCOPE
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'stevearc/aerial.nvim',
    },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension('project')
      telescope.load_extension('aerial')
    end,
  }

  -- COLORSCHEME
  use {'tjdevries/gruvbuddy.nvim',
    requires = 'tjdevries/colorbuddy.vim'
  }

  use {'/home/redbug312/.config/nvim/cactusbuddy',
    requires = {
      'tjdevries/colorbuddy.vim',
      'tjdevries/express_line.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local colorbuddy = require('colorbuddy')
      vim.g.cactusbuddy_express_line_enabled = true
      colorbuddy.colorscheme('cactusbuddy')
    end
  }

  -- MOTION & TEXT-OBJECTS
  use 'christoomey/vim-sort-motion'  -- gs
  use 'junegunn/vim-easy-align'      -- ga

  -- MISCELLANEOUS
  use 'wakatime/vim-wakatime'
  use 'tjdevries/train.nvim'
  use 'tweekmonster/startuptime.vim'

  -- USER-INTERFACE
  use {'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup {
        signs = {
          add          = { hl = 'LineNr', text = '│' },
          change       = { hl = 'LineNr', text = '│' },
          delete       = { hl = 'LineNr', text = '═' },
          topdelete    = { hl = 'LineNr', text = '╤' },
          changedelete = { hl = 'LineNr', text = '╧' },
        }
      }
    end
  }

  use {'numtostr/FTerm.nvim',
    config = function()
      local fterm = require('FTerm')
      fterm.setup {
        dimensions = { height = 0.9, width = 0.7 },
        border = 'single'
      }
    end
  }

  use {'kyazdani42/nvim-tree.lua',
    config = function()
      vim.g.nvim_tree_update_cwd = 1
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
      vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 0,
        folder_arrows = 0,
      }
    end
  }

  use {'stevearc/aerial.nvim',
    config = function()
      vim.g.aerial = {
        placement_editor_edge = true,
        manage_folds = true,
        min_width = 30,
        max_width = 30,
        -- filter_kind = false,
        filter_kind = {
          'Class',
          'Constructor',
          'Enum',
          'Field',
          'Function',
          'Interface',
          'Method',
          'Module',
          -- 'Object',
          'Struct',
        },
        icons = {
          Collapsed = ' ▷',
          Enum = 'ᴇᴍ',
          Field = 'ꜰᴅ',
          Function = 'ꜰɴ',
          Interface = 'ɪꜰ',
          Module = 'ᴍᴅ',
          -- Object = 'ᴏᴊ',
          Struct = 'ꜱᴛ',
        },
      }
    end
  }

end)
