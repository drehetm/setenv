-- Collection of user defined keymappings

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>w", ":w<CR>", opts) -- Save file
keymap("n", "<leader>q", ":q<CR>", opts) -- Quit
keymap("n", "<leader>x", ":x<CR>", opts) -- Save and exit
keymap("n", "<leader>h", ":nohlsearch<CR>", opts) -- Turn off highlighting until the next search

