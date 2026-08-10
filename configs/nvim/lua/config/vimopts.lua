-- Collection of user defined general Neovim options

local opt = vim.opt

-- UI options
opt.number = true         -- Show line numbers
opt.splitright = true     -- Make vertical splits open to the right
opt.splitbelow = true     -- Make horizontal splits open below
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.showmode = true       -- Enable show mode
opt.signcolumn = "yes:2"  -- Always show column for signs
opt.cursorline = true     -- Highlight the current line
opt.scrolloff = 8         -- Keep 8 lines above/below cursor when scrolling

-- Indentation
opt.expandtab = true      -- Use spaces instead of tabs
opt.tabstop = 2           -- Set the width of a tab to 2 spaces
opt.shiftwidth = 2        -- Set the number of spaces for indentation
opt.softtabstop = 2       -- Make backspace delete 2 spaces at a time
opt.smartindent = true    -- Insert indents automatically
opt.wrap = true           -- Wrap lines

-- Files
opt.undofile = true       -- Enable persistent undo
opt.autoread = true       -- Auto reload files changed outside vim

-- Performance
opt.updatetime = 300      -- Faster completion
opt.timeoutlen = 800      -- Time (in milliseconds) to wait for a key sequence to complete

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Other
opt.mouse = "a"           -- Enable mouse mode
opt.completeopt = { "menuone", "noselect" } -- Better completion experience

