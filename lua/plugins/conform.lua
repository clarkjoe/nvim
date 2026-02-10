return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- Configure formatters by filetype
      -- Installation is handled by mason-tool-installer.lua
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt" },
        -- go = { "gofmt" }, -- Disabled
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        -- Add more formatters as needed
      },

      -- Format on save (optional, comment out if you prefer manual formatting)
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP formatting if no formatter is configured
      },
    })

    -- Manual format keymap (in addition to <leader>f from LSP)
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
