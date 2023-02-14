local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>pf', builtin.find_files, {})
keymap.set('n', '<C-p>', builtin.git_files, {})
-- requires ripgrep (https://github.com/BurntSushi/ripgrep)
keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
