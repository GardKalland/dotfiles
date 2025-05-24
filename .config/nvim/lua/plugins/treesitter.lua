return {
  {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
    config = function()
      require("nvim-tree").setup {
        git = {
          enable = true, -- Enable Git integration
          ignore = false, -- Do not exclude files listed in .gitignore
        },
        filters = {
          dotfiles = true, -- Show dotfiles
          custom = {}, -- Ensure no custom filters
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      }
    end,
  },
}
