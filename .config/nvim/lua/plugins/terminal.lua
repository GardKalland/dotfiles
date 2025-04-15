return {
  {
    "NvChad/nvterm",
    keys = {
      { "<leader>tf", desc = "Toggle Floating Terminal" },
      { "<leader>tt", desc = "Toggle Horizontal Terminal" },
      { "<leader>tv", desc = "Toggle Vertical Terminal" },
    },
    config = function()
      require("nvterm").setup()

      local term = require "nvterm.terminal"

      vim.keymap.set("n", "<leader>tf", function()
        term.toggle "float"
      end, { desc = "Toggle Floating Terminal" })

      vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
      vim.keymap.set("n", "<leader>tt", function()
        term.toggle "horizontal"
      end, { desc = "Toggle Horizontal Terminal" })

      vim.keymap.set("n", "<leader>tv", function()
        term.toggle "vertical"
      end, { desc = "Toggle Vertical Terminal" })
    end,
  },
}
