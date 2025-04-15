-- plugins/lspconfig.lua

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        "html",
        "ts_ls",
        "prettier",
        "eslint",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "configs.masonlsp"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
