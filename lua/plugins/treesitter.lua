-- Parsers we want available everywhere; installed eagerly on startup.
local ensure_installed = {
  "lua",
  "java",
  "python",
  "bash",
  "javascript",
  "typescript",
  "html",
  "css",
  "json",
  "markdown",
  "markdown_inline", -- required by markview.nvim for inline elements
  "yaml", -- markdown front matter
  "c",
  "rust",
  "go",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Pin to `master`: the `main` branch requires Neovim 0.12 (nightly), and we
    -- run stable 0.11.x. `master` is locked but supported for 0.11 compatibility.
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = ensure_installed,
        auto_install = true, -- install missing parsers on first open of a filetype
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        },
      })
    end,
  },
}
