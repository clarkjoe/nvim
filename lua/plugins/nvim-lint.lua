return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters by filetype
    lint.linters_by_ft = {
      -- Add more linters for other filetypes here
      -- markdown = { "vale" },
      python = { "ruff" },
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- go = { "golangcilint" },
      -- lua = { "luacheck" },
    }

    -- Create autocommand to run linter
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: Manual linting keymap
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
