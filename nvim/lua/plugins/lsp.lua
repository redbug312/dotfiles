local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/lsp_extensions.nvim",
    {
      "chrisgrieser/nvim-lsp-endhints",
      config = function()
        require("lsp-endhints").setup {
          icons = {
            type = "■ ",
            parameter = "■ ",
            offspec = "■ ",
            unknown = "■ ",
          },
        }
      end,
    },
  },
  event = "BufReadPre",
}

function M.config()
  local windows = require('lspconfig.ui.windows')
  local custom_init = function(client, init)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = nil
      client.server_capabilities.semanticTokensProvider = nil
    end
  end

  -- Global LspAttach autocommand to enable inlay hints when supported
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end,
  })

  local hover_handler = function(err, result, ctx, config)
    config = config or {}
    config.border = "single"
    return vim.lsp.handlers.hover(err, result, ctx, config)
  end

  local handlers = {
    ["textDocument/hover"] = hover_handler,
  }

  -- Define LSP configurations using Neovim 0.11/0.12+ native API
  vim.lsp.config('rust_analyzer', {
    on_init = custom_init,
    handlers = handlers,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          extraEnv = {
            RUSTFLAGS = "-A dead_code", -- https://stackoverflow.com/a/76095190
          }
        },
        check = {
          -- command = "clippy",
          invocationLocation = "root",
        },
        diagnostics = {
          disabled = {
            "unresolved-extern-crate", -- rust-analyzer#6714
            "unresolved-proc-macro",   -- rust-analyzer#7497
            "inactive-code",
          }
        }
      }
    }
  })

  vim.lsp.config('pylsp', {
    handlers = handlers,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'E501', 'W504'},
          }
        }
      }
    }
  })

  vim.lsp.config('clangd', {
    handlers = handlers,
  })

  vim.lsp.config('taplo', {
    handlers = handlers,
  })

  -- Enable the configured servers
  vim.lsp.enable({ 'rust_analyzer', 'pylsp', 'clangd', 'taplo' })

  vim.lsp.handlers["textDocument/hover"] = hover_handler
  windows.default_options.border = 'single'
end

return M
