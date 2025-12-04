return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    -- Enable git blame by default
    vim.g.gitblame_enabled = 1
    -- Optional: Customize the message format
    vim.g.gitblame_message_template = '<summary> • <date> • <author>'
    -- Optional: Date format
    vim.g.gitblame_date_format = '%r'
    -- Optional: Highlight group
    vim.g.gitblame_highlight_group = "Comment"
    -- Toggle git blame on/off
    vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>",
      { noremap = true, silent = true, desc = "Toggle git blame" })
  end,
}
