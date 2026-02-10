return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    -- Centralized installation for LSPs, linters, formatters, and DAPs
    -- IMPORTANT: Use Mason package names here (check :Mason for exact names)
    -- Mason names often differ from lspconfig names (e.g., "lua-language-server" vs "lua_ls")

    -- Separate lists for different tool types
    -- Note: These use Mason package names, not lspconfig names
    local lsp_servers = {
      "lua-language-server",  -- lspconfig: lua_ls
      "rust-analyzer",        -- lspconfig: rust_analyzer
      "kotlin-language-server", -- lspconfig: kotlin_language_server
      "buf-language-server",  -- lspconfig: buf_ls
      "omnisharp",            -- lspconfig: omnisharp
      "pyright",              -- lspconfig: pyright
      "gopls",                -- lspconfig: gopls
    }

    local linters = {
      "ruff",          -- Python
      "golangci-lint", -- Go
    }

    local formatters = {
      "stylua",   -- Lua
      "prettier", -- JS/TS/JSON/YAML/Markdown/HTML/CSS
      "black",    -- Python
      -- Note: rustfmt comes with rust toolchain
      -- Note: gofmt comes with go toolchain
    }

    local dap_adapters = {
      "debugpy", -- Python
    }

    -- Combine all lists
    local ensure_installed = {}
    vim.list_extend(ensure_installed, lsp_servers)
    vim.list_extend(ensure_installed, linters)
    vim.list_extend(ensure_installed, formatters)
    vim.list_extend(ensure_installed, dap_adapters)

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay before install on startup
    })
  end,
}
