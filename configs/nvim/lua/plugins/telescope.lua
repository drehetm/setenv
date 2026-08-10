-- Install and configure `Telescope` plugin for fuzzy finding

return {
  {
    'nvim-telescope/telescope.nvim',
    name = "telescope",
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()   -- `config` is executed when the plugin loads
      require("telescope").setup({})

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      local builtin = require('telescope.builtin')  -- Load plugin's `builtin` module

      -- Setup plugin's key mappings
      keymap('n', '<C-p>', builtin.find_files, opts)
      keymap('n', '<leader>fg', builtin.live_grep, opts)
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    name = "telescope-ui-select",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  },
}

