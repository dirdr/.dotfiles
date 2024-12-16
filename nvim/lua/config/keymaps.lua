-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- greatest remap ever (Paste over selection without yanking)
vim.keymap.set("x", "p", "P")

-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>")
