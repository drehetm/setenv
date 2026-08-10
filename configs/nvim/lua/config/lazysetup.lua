-- Setup and load Lazy package manager

-- Load Lazy module and setup it with user's settings
-- See the documentation for more details about configurational options
require("lazy").setup({
  spec = {
    -- Import modules from 'lua/plugins/' directory automatically
    { import = "plugins" },
  },
  -- Colorscheme that will be used when installing plugins
  install = { colorscheme = { "habamax" } },
  -- Disable automatic plugin update checks
  checker = { enabled = false },
  -- Suppress `:checkhealth lazy` warnings
  rocks = { enabled = false },
})

