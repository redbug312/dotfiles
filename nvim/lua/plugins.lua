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

  use {'tpope/vim-surround',
    requires = 'tpope/vim-repeat',
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

  use {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'windwp/nvim-autopairs',
    },
    config = function()
      local cmp = require('cmp')
      local autopairs = require('nvim-autopairs')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      autopairs.setup {}
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
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    end
  }

  -- TREE-SITTER
  use {'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    requires = {
      -- 'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'RRethy/nvim-treesitter-textsubjects',
    },
    config = function()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup {
        ensure_installed = 'all',
        ignore_install = { 'phpdoc' },
        highlight = {
          enable = true,
          disable = {'bash', 'rust', 'css', 'latex', 'make'}
        },
        indent = {
          enable = true,
          disable = {'rust', 'latex'}
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
      'nvim-lua/lsp_extensions.nvim',
      'lvimuser/lsp-inlayhints.nvim',
      'stevearc/aerial.nvim',
    },
    config = function()
      local lsp = require('lspconfig')
      local aerial = require('aerial')
      local inlays = require('lsp-inlayhints')
      local custom_attach = function(client, bufnr)
        aerial.on_attach(client, bufnr)
        inlays.on_attach(client, bufnr)
      end
      lsp.rust_analyzer.setup {
        on_attach = custom_attach,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              disabled = {
                "unresolved-extern-crate", -- rust-analyzer#6714
                "unresolved-proc-macro",   -- rust-analyzer#7497
                -- "inactive-code",
              },
            },
          }
        }
      }
      lsp.pyright.setup {
        on_attach = custom_attach,
      }
      lsp.clangd.setup {
        on_attach = custom_attach,
      }
    end
  }

  -- TELESCOPE
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-bibtex.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'stevearc/aerial.nvim',
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown()
          }
        }
      }
      telescope.load_extension('project')
      telescope.load_extension('aerial')
      telescope.load_extension('bibtex')
      telescope.load_extension('ui-select')
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
      local nvim_tree = require('nvim-tree')
      nvim_tree.setup {
        update_cwd = true,
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = '',
              symlink = '',
              git = {
                unstaged  = '△',
                staged    = '✓',
                unmerged  = '!',
                renamed   = '-',
                untracked = '+',
                deleted   = '×',
                ignored   = '~',
              },
              folder = {
                arrow_closed = '▶',
                arrow_open   = '▼',
                default      = '▶',
                open         = '▼',
                empty        = '▷',
                empty_open   = '▽',
              }
            }
          }
        }
      }
      end
    }

  use {'stevearc/aerial.nvim',
    config = function()
      local aerial = require('aerial')
      aerial.setup {
        placement_editor_edge = true,
        manage_folds = true,
        min_width = 30,
        max_width = 30,
        filter_kind = {
          'Class',
          'Constructor',
          'Enum',
          'Field',
          'Function',
          'Interface',
          'Method',
          'Module',
          'Struct',
        },
        icons = {
          Collapsed = ' ▷',
          Class = 'ᴄʟ',
          Enum = 'ᴇᴍ',
          Field = 'ꜰᴅ',
          Function = 'ꜰɴ',
          Interface = 'ɪꜰ',
          Module = 'ᴍᴅ',
          Struct = 'ꜱᴛ',
        },
      }
    end
  }

end)
