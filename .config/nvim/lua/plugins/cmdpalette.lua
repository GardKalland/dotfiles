return {
  -- UI components used by noice
  { "MunifTanjim/nui.nvim" },

  -- Noice: floating command palette and LSP UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify", -- optional, enhances notifications
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- ?? centered popup
      },
      views = {
        cmdline_popup = {
          position = {
            row = "40%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
        },
      },
      messages = {
        enabled = true,
        view = "mini",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        command_palette = true, -- better ":" UI
        lsp_doc_border = true, -- border on hover/signature
      },
    },
  },
}
