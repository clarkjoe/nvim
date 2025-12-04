return {
  "mbbill/undotree",
  config = function()
    -- Keybinding to toggle undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    -- Optional: Configure undotree settings
    vim.g.undotree_WindowLayout = 2 -- Layout style
    vim.g.undotree_SetFocusWhenToggle = 1 -- Focus undotree when toggled
    vim.g.undotree_ShortIndicators = 1 -- Use short time indicators
  end,
}
