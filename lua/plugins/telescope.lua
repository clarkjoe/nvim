return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        -- Default configuration for telescope goes here
        mappings = {
          i = {
            -- Insert mode mappings
          },
          n = {
            -- Normal mode mappings
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here
      },
      extensions = {
        -- Your extension configuration goes here
      },
    })

    -- Keybindings
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
    keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers" })
    keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
    
    -- Requires ripgrep (https://github.com/BurntSushi/ripgrep)
    keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Grep string" })
    
    keymap.set("n", "<leader>a", builtin.lsp_document_symbols, { desc = "LSP document symbols" })
  end,
}
