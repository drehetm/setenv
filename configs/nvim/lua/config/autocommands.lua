-- Collection of user defined autocommands

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local cursor_pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", cursor_pos)
  end,
})

-- Ensure files end with a newline on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Save cursor position
    local cursor_pos = vim.fn.getpos(".")

    -- Check if the last line doesn't end with a newline
    local last_line = vim.fn.line("$")
    local last_line_text = vim.fn.getline(last_line)

    if last_line > 0 and last_line_text ~= "" then
      -- Append a newline
      vim.fn.execute("$s/$/\\r/e")
    end

    -- Restore cursor position
    vim.fn.setpos(".", cursor_pos)
  end,
})

-- Define default and filetype-specific themes
local default_theme = "gruvbox"
local markdown_theme = "gruvbox" -- "dracula"
local current_theme = nil -- no theme applied yet

-- Set distinct theme for specific filetype
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype
    local target_theme = default_theme

    if ft == "markdown" then
      target_theme = markdown_theme
    end

    if current_theme ~= target_theme then
      vim.cmd("colorscheme " .. target_theme)
      current_theme = target_theme
    end
  end,
})

