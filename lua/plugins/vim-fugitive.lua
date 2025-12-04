return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  config = function()
    -- Keybindings for common Git operations
    vim.keymap.set("n", "<leader>gs", ":Git<CR>",
      { noremap = true, silent = true, desc = "Git status" })
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>",
      { noremap = true, silent = true, desc = "Git commit" })
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>",
      { noremap = true, silent = true, desc = "Git push" })
    vim.keymap.set("n", "<leader>gl", ":Git pull<CR>",
      { noremap = true, silent = true, desc = "Git pull" })
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>",
      { noremap = true, silent = true, desc = "Git diff split" })
    vim.keymap.set("n", "<leader>gB", ":Git blame<CR>",
      { noremap = true, silent = true, desc = "Git blame (full)" })
  end,
}
