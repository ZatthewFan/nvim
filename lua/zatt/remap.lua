vim.g.mapleader = " "

-- -- when using netrw
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("v", "<leader>pv", vim.cmd.Ex)

-- -- when using nvim-tree
-- vim.keymap.set("n", "<leader>pv", ":NvimTreeFindFileToggle<CR>")
-- vim.keymap.set("v", "<leader>pv", ":NvimTreeFindFileToggle<CR>")

-- when using oil.nvim
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("v", "-", require("oil").open, { desc = "Open parent directory" })

-- move highlighted lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle of screen when doing these actions
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pasting over highlighted text would keep the pasted text in buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- <leader>y yanks into + (system) register; keeps vim and system clipboard separate
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- deletes into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>x", "\"_x")
vim.keymap.set("v", "<leader>x", "\"_x")

-- unbinds Q and q
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replaces all instances of current text with input
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- clears search highlighting
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- rebinds : in visual mode to not do '<,'>
-- vim.keymap.set("v", ":", ":<C-U>")

-- rebinds Ctrl+c to Esc
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- WhichKey shortcut
vim.keymap.set("n", "<leader>wk", ":WhichKey")
vim.keymap.set("v", "<leader>wk", ":WhichKey")

-- enabling "B" "E" "W" to enter visual mode and highlight words
vim.keymap.set("n", "B", "<Esc>vb")
vim.keymap.set("n", "E", "<Esc>ve")
vim.keymap.set("n", "W", "<Esc>vw")

-- enabling Ctrl+Backspace to delete words
vim.keymap.set("n", "<C-BS>", "vb<leader>d")
vim.keymap.set("i", "<C-BS>", "<Esc>vb<leader>di")

-- Ctrl+Backspace for arch vm
vim.keymap.set("n", "<C-H>", "vb<leader>d")
vim.keymap.set("i", "<C-H>", "<C-w>")
