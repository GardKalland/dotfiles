return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- v2 is the new Lua API version
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"

      harpoon:setup()
    end,
  },
}
