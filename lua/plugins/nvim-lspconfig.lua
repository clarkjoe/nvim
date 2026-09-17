return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- List of language servers to enable
    -- Per-server settings/filetypes live in nvim/after/lsp/<name>.lua (auto-discovered
    -- via runtimepath; after/lsp/ takes priority over nvim-lspconfig's own lsp/ defaults).
    -- Installation is handled by mason-tool-installer.lua
    local language_servers = {
      "lua_ls",
      "buf_ls",
      "pyright",
      "gopls",
      "terraformls",
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

    -- Buffer-local keymaps on LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufopts = { noremap = true, silent = true, buffer = args.buf }
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
        -- Note: <leader>cf in conform.nvim is preferred for formatting
        -- This LSP format is kept as fallback
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", bufopts, { desc = "Format buffer (LSP)" }))
      end,
    })

    -- Shared defaults applied to every server; per-server overrides live in
    -- nvim/lsp/<name>.lua
    vim.lsp.config("*", {
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.enable(language_servers)
  end,
}
