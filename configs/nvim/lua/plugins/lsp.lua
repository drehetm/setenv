-- Install set of plugins needed to setup LSP

return {
  {
    "williamboman/mason.nvim",
    name = "mason",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    name = "mason-lspconfig",
    lazy = false,
    opts = {
      -- A list of LSP servers to automatically install if they're not already installed
      ensure_installed = {
        "lua_ls",
        "gopls",
        "bashls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    name = "nvim-lspconfig",
    lazy = false,
    config = function()
      -- Hook up LSP language-specific servers to Neovim
      -- Enabled servers will be auto-activated when a filetype is opened
      vim.lsp.enable("lua_ls")

      vim.lsp.enable("gopls")

      vim.lsp.config('bashls', {
        filetypes = { 'bash', 'sh', 'zsh' },
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command|.zsh)"
          }
        }
      })
      vim.lsp.enable("bashls")

      -- Define LSP related keymappings
      local keymap = vim.keymap.set
      local buf = vim.lsp.buf
      local opts = { noremap = true, silent = true }

      keymap("n", "K", buf.hover, opts)
      keymap("n", "<leader>gd", buf.definition, opts)
      keymap("n", "<leader>gr", buf.references, opts)
      keymap("n", "<leader>ca", buf.code_action, opts)
      keymap('n', '<leader>rn', buf.rename, opts)
    end,
  },
}

