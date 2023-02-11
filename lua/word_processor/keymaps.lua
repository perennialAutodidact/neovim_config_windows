local opts = { noremap = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   "n" - normal mode
--   "i" - insert mode
--   "v" - visual mode
--   "x" - visual block mode
--   "t" - terminal mode
--   "c" - command mode

-------------
--  Normal --
-------------

--  Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Window splitting
keymap("n", "<leader>\\", ":vertical split<CR>", opts)
keymap("n", "<leader>-", ":split<CR>", opts)

-- Nvim Tree

-- True Zen Mode
keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", {})
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", {})
keymap("n", "<leader>fb", ":Telescope buffers<CR>", {})
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", {})

-------------
-- Command --
-------------

-- semicolon for entering command mode
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)

-- autoformat text and markdown files 
keymap("n", "<leader>ll", "gggqG", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)
