return {
  {
    "mrcjkb/rustaceanvim",
    version = "*",
    lazy = false,
    enabled = function()
      local is_rust_file = vim.bo.filetype == "rust"
      local has_cargo_toml = vim.fn.filereadable(vim.fn.getcwd() .. "/Cargo.toml") == 1
      return is_rust_file or has_cargo_toml
    end,
    ft = { "rust" }, -- still limits when it's loaded lazily, good to keep
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            local map = vim.keymap.set
            local wk = require "which-key"

            map("n", "K", function()
              vim.cmd.RustLsp "hover"
            end, { buffer = bufnr, desc = "Rust: Hover" })

            wk.register({
              r = {
                name = "Rust",
                c = {
                  function()
                    vim.cmd.RustLsp "codeAction"
                  end,
                  "Code action",
                },
                d = {
                  function()
                    vim.cmd.RustLsp "debuggables"
                  end,
                  "Run debuggables",
                },
                e = {
                  function()
                    vim.cmd.RustLsp "expandMacro"
                  end,
                  "Expand macro",
                },
                h = {
                  function()
                    vim.cmd.RustLsp "hover"
                  end,
                  "Hover actions",
                },
                j = {
                  function()
                    vim.cmd.RustLsp "joinLines"
                  end,
                  "Join lines",
                },
                m = {
                  function()
                    vim.cmd.RustLsp "parentModule"
                  end,
                  "Parent module",
                },
                o = {
                  function()
                    vim.cmd.RustLsp "openCargo"
                  end,
                  "Open Cargo.toml",
                },
                p = {
                  function()
                    vim.cmd.RustLsp "renderDiagnostic"
                  end,
                  "Explain diagnostics",
                },
                r = {
                  function()
                    vim.cmd.RustLsp "reloadWorkspace"
                  end,
                  "Reload workspace",
                },
                s = {
                  function()
                    vim.cmd.RustLsp "ssr"
                  end,
                  "Structural search replace",
                },
                t = {
                  function()
                    vim.cmd.RustLsp "testables"
                  end,
                  "Run tests",
                },
                v = {
                  function()
                    vim.cmd.RustLsp "syntaxTree"
                  end,
                  "Syntax tree",
                },
                w = {
                  function()
                    vim.cmd.RustLsp "workspaceSymbol"
                  end,
                  "Workspace symbol",
                },
              },
            }, { buffer = bufnr, prefix = "<leader>" })

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false }
              end,
            })
          end,

          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              inlayHints = { enable = true },
            },
          },
        },
      }
    end,
  },
}
