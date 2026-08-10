## Others/Unsorted
* `@:` - repeat the last executed command
* `@@` - repeat the last executed macro
* `:e` - reload current buffer
* `:source %` - execute Neovim's Lua code written in the current file (== `%`). It is usually used to apply updated Neovim Lua config without restarting the Neovim.
* `:help vim.lsp.buf` - see list of available LSP functions

## Jumping Between Positions in Neovim
* `gf` - Mnemonic `Go to File`. Opens file by path under the cursor.
* `<leader>gr` - Mnemonic `Grep References`. Find in which places function or variable under cursor is used.
* `%` - Jump between parentheses, if-fi, do-done, etc.
* `C-]` - go to definition
* `<C-O>` - (`O` means `out`) Jumps backwards in the jump list to the previous cursor position.
* `<C-I>` - (`I` means `in`) Jumps forwards in the jump list to the next cursor position.
This allows you to navigate through your jump history. The jump list tracks cursor movements triggered by commands like searches (/, ?), marks, or commands that move the cursor to a new location.

## Telescope
* `<C-p>` - find file by name
* `<leader>fg` - Mnemonic `File Grep`. Find file by its content

## Neo-tree
* `<leader>e` - Mnemonic `Explorer`. Explore filesystem in Neo-tree left side bar
* `<C-n>` - Mnemonic `Control Neo`. Open Neo-tree in floating window
* Press it when cursor is inside of the Neo-tree window:
    * `a` - add a new file/directory
    * `?` - view the list of keymappings

