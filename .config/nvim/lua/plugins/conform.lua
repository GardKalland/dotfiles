return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- triggers format-on-save
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = require "configs.conform",
  },
}
