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

    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local opts = function(desc)
        return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- "i" over a directory → cd into it (make it the new root)
      vim.keymap.set("n", "i", function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" then
          api.tree.change_root_to_node(node)
        end
      end, opts("CD into directory (set as root)"))

      -- "o" → move root up to parent directory
      vim.keymap.set("n", "o", function()
        api.tree.change_root_to_parent()
      end, opts("Move root up to parent directory"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
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
