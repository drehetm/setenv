-- Install and configure `Neo-tree` plugin for rich filesystem view

-- You do not need to call require('neo-tree').setup({ ... }) for Neo-tree to work. setup() is only used for configuration.

return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,   -- Show hidden files and dirs using inactive color
        never_show = {    -- Remains hidden forever
          ".DS_Store",
        },
      },
    },
  },
  config = function(_, opts)          -- `config` is executed when the plugin loads
    require("neo-tree").setup(opts)   -- Load and setup plugin with defined above options

    local keymap = vim.keymap.set
    local keyopts = { noremap = true, silent = true }

    -- Setup plugin's key mappings
    keymap('n', '<C-n>', ':Neotree filesystem reveal float<CR>', keyopts)
    keymap("n", "<leader>e", ':Neotree filesystem reveal left<CR>', keyopts)
  end,
}

