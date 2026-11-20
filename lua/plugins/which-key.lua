return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>g", group = "git" },
      { "<leader>gS", group = "gitsigns hunks", mode = { "n", "v" } },
      { "<leader>go", group = "open URL" },
      { "<leader>p", group = "find" },
      { "<leader>cp", group = "copy path" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer local keymaps",
    },
  },
}
