return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup DAP UI
    dapui.setup({})

    -- Setup virtual text (shows variable values inline)
    require("nvim-dap-virtual-text").setup({
      commented = true, -- Show virtual text alongside comments
    })

    -- Automatically open/close DAP UI on debug events
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.after.event_initialized.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Toggle DAP UI keymap
    vim.keymap.set("n", "<leader>du", function()
      dapui.toggle()
    end, { noremap = true, silent = true, desc = "Toggle DAP UI" })
  end,
}
