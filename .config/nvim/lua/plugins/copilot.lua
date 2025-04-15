return {
{
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
    lazy = false,
},
}
