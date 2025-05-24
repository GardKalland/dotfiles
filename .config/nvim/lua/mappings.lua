require "nvchad.mappings"

local map = vim.keymap.set
-- Neovim completion keybindings
map("i", "<Tab>", 'pumvisible() ? "<C-y>" : "<Tab>"', { noremap = true, silent = true, expr = true })
map("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<C-j>"', { noremap = true, silent = true, expr = true })
map("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<C-k>"', { noremap = true, silent = true, expr = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<S-h>", function()
  local ok, tabufline = pcall(require, "nvchad.tabufline")
  if ok and vim.fn.buflisted(vim.fn.bufnr()) == 1 then
    tabufline.prev()
  end
end, { desc = "Previous buffer" })

map("n", "<S-l>", function()
  local ok, tabufline = pcall(require, "nvchad.tabufline")
  if ok and vim.fn.buflisted(vim.fn.bufnr()) == 1 then
    tabufline.next()
  end
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

-- Harpoon keybindings
local harpoon = require "harpoon"

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>hm", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

-- Navigate directly to files
vim.keymap.set("n", "<C-q>", function()
  harpoon:list():select(1)
end, { desc = "Go to file 1" })
vim.keymap.set("n", "<C-e>", function()
  harpoon:list():select(2)
end, { desc = "Go to file 2" })
vim.keymap.set("n", "<C-t>", function()
  harpoon:list():select(3)
end, { desc = "Go to file 3" })
vim.keymap.set("n", "<C-p>", function()
  harpoon:list():select(5)
end, { desc = "Go to file 4" })

-- -- Terminal mappings
map("n", "<leader>ts", function()
  require("nvchad.term").new { pos = "sp", size = 0.3 }
end, { desc = "Open horizontal terminal" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp", cmd = "neofetch" }
end, { desc = "Open vertical terminal with neofetch" })

map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { noremap = true, silent = true })
map("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", { noremap = true, silent = true })

-- LSP Configs
map("n", "<leader>rn", function()
  require "nvchad.lsp.renamer"()
end, { desc = "LSP Rename" })
