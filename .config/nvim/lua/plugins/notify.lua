return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.notify").setup()
    end,
  },
}
