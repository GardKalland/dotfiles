return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-rust",
        },
      }
    end,
  },
}
