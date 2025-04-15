vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-CR>", "copilot#Accept()", { noremap = true, silent = true, expr = true })
