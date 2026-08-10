-- Install and configure `Treesitter` plugin

return  {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",   -- run require(MAIN).setup(opts)
  opts = {                -- Configure plugin with user defined options
    ensure_installed = {  -- List of parsers
      "lua",              -- for Neovim config
      "bash",             -- for ZSH files
      "markdown",
      "markdown_inline",
      "git_rebase",
      "gitcommit",
      "go",
      "yaml",
      "ini",
      "json",
    },
    auto_install = true,  -- Automatically install missing parsers when entering buffer
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}

