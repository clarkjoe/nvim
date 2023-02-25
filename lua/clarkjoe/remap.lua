vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- prettier
vim.keymap.set("n", "<leader>pp", ":silent %!prettier --stdin-filepath %<CR>")

-- terminal
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>tt", ":tabnew|:te<CR>")
vim.keymap.set("n", "<leader>vt", ":vs|:te<CR>")
vim.keymap.set("n", "<leader>ht", ":split|:te<CR>")
vim.keymap.set("n", "<leader>z", "<C-w>|")
vim.keymap.set("n", "<leader>Z", "<C-w>=")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Undo
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
