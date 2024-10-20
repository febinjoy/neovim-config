return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "sqlls",
          "bashls",
          "gopls",
          "docker_compose_language_service",
          "jsonls",
          "cssls",
          "html",
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup ({})
      lspconfig.ts_ls.setup ({})
      lspconfig.sqlls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.jsonls.setup({
        capabilities = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
        end
      })
      lspconfig.cssls.setup({
        capabilities = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
        end
      })
      lspconfig.html.setup({
        capabilities = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
        end
      })
    end
  }
}
