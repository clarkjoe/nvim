local keymap = vim.keymap

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>tv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- prettier
keymap.set("n", "<leader>pp", ":silent %!prettier --stdin-filepath %<CR>")

-- terminal
keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")
keymap.set("n", "<leader>tt", ":tabnew|:te<CR>")
keymap.set("n", "<leader>vt", ":vs|:te<CR>")
keymap.set("n", "<leader>ht", ":split|:te<CR>")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")
--keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- NvimTree
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>F", ":NvimTreeFindFile<CR>")

-- Undo
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Git
keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Tabs
keymap.set("n", "<leader>z", ":-tabedit %<CR>")
keymap.set("n", "<leader>Z", ":tabclose<CR>")
