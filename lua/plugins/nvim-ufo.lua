return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    -- Fold settings
    vim.o.foldcolumn = "1" -- Show fold column
    vim.o.foldlevel = 99 -- Using ufo provider needs a large value
    vim.o.foldlevelstart = 99 -- Start with all folds open
    vim.o.foldenable = true -- Enable folding

    -- Setup nvim-ufo
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Use treesitter for most files, fallback to indent
        return { "treesitter", "indent" }
      end,
    })

    -- Keybindings
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  end,
}
