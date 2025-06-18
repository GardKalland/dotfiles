local M = {}

function M.setup()
  require("notify").setup {
    background_colour = "#000000",
    stages = "fade_in_slide_out",
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    render = "default",
    top_down = true,
  }

  vim.notify = require "notify"
end

return M
