local M = {}

function M.setup()
  vim.diagnostic.config {
    virtual_text = {
      spacing = 4,
      prefix = "?", -- or "?", "?", "?", ">>"
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  }
  -- Set up Mason
  require("mason").setup {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "?",
        package_pending = "?",
        package_uninstalled = "?",
      },
    },
  }

  -- Set up Mason-LSPConfig
  require("mason-lspconfig").setup {
    automatic_installation = true, -- Automatically detect and install servers
  }

  -- Set up LSP handlers
  require("mason-lspconfig").setup_handlers {
    -- Default handler for all servers
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      }
    end,
    -- Example: Custom handler for lua_ls
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
    end,
  }
end

return M
