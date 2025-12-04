return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    local language_servers = {
      "lua_ls",
      "rust_analyzer",
      "kotlin_language_server",
      "buf_ls",
      "omnisharp",
    }

    require("mason-lspconfig").setup({
      ensure_installed = language_servers,
      automatic_installation = true,
    })
  end,
}
