return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local language_servers = {
      "lua_ls",
      "rust_analyzer",
      "kotlin_language_server",
      "buf_ls",
      "omnisharp",
    }

    local language_server_filetypes = {
      lua_ls = { "lua" },
      rust_analyzer = { "rust" },
      gopls = { "go" },
      kotlin_language_server = { "kotlin", "kt" }
    }

    -- Setup capabilities for autocompletion and folding
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities()
      or vim.lsp.protocol.make_client_capabilities()

    -- Enable folding with nvim-ufo
    capabilities.textDocument = capabilities.textDocument or {}
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- Global diagnostic keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
      vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
      vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" }))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
      vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" }))
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
      vim.tbl_extend("force", opts, { desc = "Add diagnostics to location list" }))

    -- LSP attach function with buffer-local keymaps
    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
        vim.tbl_extend("force", bufopts, { desc = "Go to declaration" }))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        vim.tbl_extend("force", bufopts, { desc = "Go to definition" }))
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
        vim.tbl_extend("force", bufopts, { desc = "Go to implementation" }))
      vim.keymap.set("n", "K", vim.lsp.buf.hover,
        vim.tbl_extend("force", bufopts, { desc = "Hover documentation" }))
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, vim.tbl_extend("force", bufopts, { desc = "List workspace folders" }))
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition,
        vim.tbl_extend("force", bufopts, { desc = "Type definition" }))
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
        vim.tbl_extend("force", bufopts, { desc = "Rename symbol" }))
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
        vim.tbl_extend("force", bufopts, { desc = "Code action" }))
      vim.keymap.set("n", "gr", vim.lsp.buf.references,
        vim.tbl_extend("force", bufopts, { desc = "Show references" }))
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, vim.tbl_extend("force", bufopts, { desc = "Format buffer" }))
    end

    local lsp_flags = {
      debounce_text_changes = 150,
    }

    -- Setup each language server
    for _, ls in ipairs(language_servers) do
      local config = {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        filetypes = language_server_filetypes[ls],
      }

      -- Special configuration for lua_ls
      if ls == "lua_ls" then
        config.settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" },
            },
          },
        }
      end

      vim.lsp.config(ls, config)
      vim.lsp.enable(ls)
    end
  end,
}
