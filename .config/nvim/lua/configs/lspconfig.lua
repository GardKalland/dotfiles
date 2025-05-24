-- Load Mason-LSPConfig's default handlers via the masonlsp file
require("configs.masonlsp").setup()

-- Custom overrides for specific servers, if needed
local lspconfig = require "lspconfig"

-- lspconfig.rust_analyzer.setup {
--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
--   on_attach = function(client, bufnr)
--     local opts = { buffer = bufnr, silent = true }
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--   end,
-- }

-- lspconfig.ts_ls.setup {
--   on_attach = function(client, bufnr)
--     local opts = { buffer = bufnr, silent = true }
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   end,
-- }
