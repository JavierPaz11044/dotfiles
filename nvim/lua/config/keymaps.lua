local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Guardar
keymap.set("n", "<leader>w", ":w<CR>")

-- Salir
keymap.set("n", "<leader>q", ":q<CR>")

-- Limpiar búsqueda
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Mejor navegación entre splits
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Mover líneas visualmente
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

