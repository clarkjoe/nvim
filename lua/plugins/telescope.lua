return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  lazy = false,
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
    keymap.set("n", "<C-p>", function()
        local ok = pcall(builtin.git_files)
        if not ok then
            builtin.find_files()
        end
    end, { desc = "Find git files (or all files)" })

    -- Requires ripgrep (https://github.com/BurntSushi/ripgrep)
    keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Grep string" })

    keymap.set("n", "<leader>a", builtin.lsp_document_symbols, { desc = "LSP document symbols" })
  end,
}
