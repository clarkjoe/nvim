return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    -- debugpy installation is handled by mason-tool-installer.lua
    local dap_python = require("dap-python")

    -- Setup Python debugger adapter
    -- Options:
    -- 1. Use project-specific venv: "/path/to/project/.venv/bin/python"
    -- 2. Use system Python: "python3"
    -- 3. Use Mason-installed debugpy: vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

    -- Using Mason-installed debugpy (recommended for consistent setup)
    local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
    dap_python.setup(debugpy_path)

    -- Uncomment to use a project-specific Python interpreter:
    -- dap_python.setup("/Users/joe.leland.clark/dev/strider/.venv/bin/python")
  end,
}
