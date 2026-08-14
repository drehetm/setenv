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
        -- Enable Treesitter only when a parser is available for this buffer.
        local has_parser = pcall(vim.treesitter.start, args.buf)

        -- Configure Treesitter indentation only for supported filetypes.
        if has_parser then
          vim.bo[args.buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
