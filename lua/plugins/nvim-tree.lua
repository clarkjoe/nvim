return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Disable netrw (recommended by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Enable 24-bit color
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      disable_netrw = false,
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      view = {
        width = "30%",
        number = true,
        relativenumber = true,
      },
    })

    -- Your keybindings
    vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>F", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Find current file in tree" })
  end,
}
