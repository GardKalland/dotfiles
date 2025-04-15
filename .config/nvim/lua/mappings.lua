require "nvchad.mappings"

local map = vim.keymap.set
-- Neovim completion keybindings
map("i", "<Tab>", 'pumvisible() ? "<C-y>" : "<Tab>"', { noremap = true, silent = true, expr = true })
map("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<C-j>"', { noremap = true, silent = true, expr = true })
map("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<C-k>"', { noremap = true, silent = true, expr = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })
map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })
map("n", "<leader>ba", function()
  require("nvchad.tabufline").closeAllBufs(true)
end, { desc = "Close all buffers" })
map("n", "<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Close all except current" })
map("n", "<leader>bl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "Close buffers to the left" })
map("n", "<leader>br", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "Close buffers to the right" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Better pane navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- -- Terminal mappings
map("n", "<leader>ts", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Open horizontal terminal" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp", cmd = "neofetch" }
end, { desc = "Open vertical terminal with neofetch" })

-- LSP Configs
map("n", "<leader>rn", function()
  require "nvchad.lsp.renamer"()
end, { desc = "LSP Rename" })
