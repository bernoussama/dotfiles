-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { silent = true })
map("i", "jj", "<esc>")
map("i", "kk", "<esc>")

-- save with sudo
vim.cmd([[cab e!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
