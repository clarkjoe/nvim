return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    -- Define sign icons for breakpoints and debugging
    local signs = {
      DapBreakpoint = { text = "●", texthl = "DiagnosticSignError" },
      DapBreakpointCondition = { text = "◆", texthl = "DiagnosticSignError" },
      DapLogPoint = { text = "◆", texthl = "DiagnosticSignInfo" },
      DapBreakpointRejected = { text = "○", texthl = "DiagnosticSignWarn" },
      DapStopped = {
        text = "▶",
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      },
    }

    for name, opts in pairs(signs) do
      vim.fn.sign_define(name, {
        text = opts.text,
        texthl = opts.texthl,
        linehl = opts.linehl or "",
        numhl = opts.numhl or "",
      })
    end

    -- DAP keymaps
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>db", function()
      dap.toggle_breakpoint()
    end, vim.tbl_extend("force", opts, { desc = "Toggle breakpoint" }))

    vim.keymap.set("n", "<leader>dc", function()
      dap.continue()
    end, vim.tbl_extend("force", opts, { desc = "Continue/Start debugging" }))

    vim.keymap.set("n", "<leader>do", function()
      dap.step_over()
    end, vim.tbl_extend("force", opts, { desc = "Step over" }))

    vim.keymap.set("n", "<leader>di", function()
      dap.step_into()
    end, vim.tbl_extend("force", opts, { desc = "Step into" }))

    vim.keymap.set("n", "<leader>dO", function()
      dap.step_out()
    end, vim.tbl_extend("force", opts, { desc = "Step out" }))

    vim.keymap.set("n", "<leader>dq", function()
      dap.terminate()
    end, vim.tbl_extend("force", opts, { desc = "Terminate debugging" }))
  end,
}
