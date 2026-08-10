-- Install and configure 'Gruvbox' colorscheme

return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,     -- Load it during startup (for default theme only)
  priority = 1000,  -- Load before other plugins
  opts = {          -- Configure plugin with user defined options
    contrast = "hard",
    transparent_mode = false,   -- Set true for transparency
    italic = {
      strings = false,          -- Show strings non-italic by default
      comments = true,
      operators = false,
      folds = true,
    },
  },
  config = function(_, opts)          -- `config` is executed when the plugin loads
    require("gruvbox").setup(opts)    -- Load and setup plugin with defined above options
    vim.o.background = "dark"         -- Set Neovim terminal background -> "light" or "dark"
    vim.cmd([[colorscheme gruvbox]])  -- Set the default Neovim colorscheme
  end,
}

