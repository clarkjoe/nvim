-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>F", ":NvimTreeFindFile<CR>")

-- empty setup using defaults
require("nvim-tree").setup {
    actions = {
        open_file = {
            resize_window = true
        }
    },
    disable_netrw = false,
    view = {
        number = true,
        relativenumber = true,
        width = "30%"
    }
}
