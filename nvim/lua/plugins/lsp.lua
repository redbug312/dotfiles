local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/lsp_extensions.nvim",
    "lvimuser/lsp-inlayhints.nvim",
  },
  event = "BufReadPre",
}

function M.config()
  local lsp = require('lspconfig')
  local inlays = require('lsp-inlayhints')
  local windows = require('lspconfig.ui.windows')
  local custom_init = function(client, init)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = nil
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
  local custom_attach = function(client, bufnr)
    inlays.on_attach(client, bufnr)
  end
  local handlers =  {
    ["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = "single" }
    )
  }
  inlays.setup {}
  lsp.rust_analyzer.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    handlers = handlers,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          extraEnv = {
            "RUSTFLAGS=\"-A dead_code\"", -- https://stackoverflow.com/a/76095190
          }
        },
        check = {
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
  }
  lsp.pylsp.setup {
    on_attach = custom_attach,
    handlers = handlers,
  }
  lsp.clangd.setup {
    on_attach = custom_attach,
    handlers = handlers,
  }
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = "single" }
  )
  windows.default_options.border = 'single'
end

return M
