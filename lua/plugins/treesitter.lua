-- Parsers we want available everywhere; installed eagerly on startup.
local ensure_installed = {
  "lua",
  "python",
  "bash",
  "json",
  "markdown",
  "yaml", -- markdown front matter
  "go",
}

-- Filetype -> parser name, for the highlight/indent/auto-install autocmd below.
-- (Only needed where the vim filetype differs from the parser name, e.g. bash -> sh.)
local parser_by_filetype = {
  sh = "bash",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = vim.tbl_keys(parser_by_filetype),
        callback = function(args)
          vim.treesitter.start()
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
