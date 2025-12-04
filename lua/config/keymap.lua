vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- prettier
vim.keymap.set("n", "<leader>pp", ":silent %!npx prettier --stdin-filepath %<CR>")

-- terminal
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>tt", ":tabnew|:te<CR>")
vim.keymap.set("n", "<leader>vt", ":vs|:te<CR>")
vim.keymap.set("n", "<leader>ht", ":split|:te<CR>")
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")
vim.keymap.set("n", "<leader>hs", ":split<CR>")
vim.keymap.set("n", "<leader>z", "<C-w>|<C-w>_")
vim.keymap.set("n", "<leader>Z", "<C-w>=")

-- nvim tmux navigator
vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', {silent = true})
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', {silent = true})
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', {silent = true})
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', {silent = true})
vim.keymap.set('n', '<C-\\>', '<Cmd>NvimTmuxNavigateLastActive<CR>', {silent = true})
vim.keymap.set('n', '<C-Space>', '<Cmd>NvimTmuxNavigateNext<CR>', {silent = true})


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<M-∆>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-˚>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Undo
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gbc", vim.cmd.GitBlameOpenCommitURL);
vim.keymap.set("n", "<leader>gbf", vim.cmd.GitBlameOpenFileURL);
vim.keymap.set("n", "<leader>gbh", vim.cmd.GitBlameCopySHA);

-- surround word
vim.keymap.set("n", "<leader>\"", "cw\"\"<ESC>P")

-- run last command easily
-- local def_opts = { silent = false, noremap = true }
-- vim.keymap.set({ 'n', 'v' }, '<CR>', ':<up>', def_opts)

-- dynamic macros
function _G.echo_next_key()
    local key = vim.fn.getchar()
    local char = vim.fn.nr2char(key)
    vim.cmd("'<,'>norm! @" .. char)
end

vim.api.nvim_set_keymap('x', '<leader>m', ':lua _G.echo_next_key()<CR>', { noremap = true, silent = true })
