return {
  {
    "mfussenegger/nvim-dap",
    ft = { "rust" },
  },
  {
    "rcarriga/nvim-dap-ui",
    -- cmd = { "DapToggleBreakpoint", "DapContinue" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()

      -- Auto open/close dapui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      map("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debug" })
      map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
      map("n", "<leader>du", dap.step_out, { desc = "Step Out" })
      map("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
      map("n", "<leader>dl", dap.run_last, { desc = "Run Last Debug" })
      map("n", "<leader>dt", dapui.toggle, { desc = "Toggle DAP UI" })

      -- Which-key group
      local wk = require "which-key"
      wk.register({
        d = {
          name = "Debug",
          b = "Toggle Breakpoint",
          c = "Start/Continue Debug",
          i = "Step Into",
          o = "Step Over",
          u = "Step Out",
          r = "Open REPL",
          l = "Run Last Debug",
          t = "Toggle DAP UI",
        },
      }, { prefix = "<leader>" })
    end, -- ? comma added here!
    dependencies = { "mfussenegger/nvim-dap" },
  },
}
