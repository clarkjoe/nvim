return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox_dark",
        icons_enabled = true,
        -- Default is a full statusline rebuild on every redraw (up to ~60/sec
        -- while moving the cursor). Over a remote SSH/Tailscale session every
        -- one of those redraws also has to hit the wire, so throttle it.
        refresh = {
          statusline = 250,
          tabline = 250,
          winbar = 250,
        },
      }
    })
  end
}
