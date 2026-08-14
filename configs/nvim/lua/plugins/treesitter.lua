-- Install and configure `Treesitter` plugin

return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    -- List of parsers
    local parsers = {
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
    }

    treesitter.setup()

    -- Install configured parsers
    treesitter.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype) or filetype

        -- Auto-install missing parser
        if not vim.treesitter.language.add(lang) then
          treesitter.install({ lang })
        end

        -- Enable Treesitter highlighting
        pcall(vim.treesitter.start, args.buf)

        -- Enable Treesitter indentation
        vim.bo[args.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
