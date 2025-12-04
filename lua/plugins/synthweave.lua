return {
  "samharju/synthweave.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local synthweave = require("synthweave")
    synthweave.setup({
      transparent = false,
      overrides = {
        LineNr = { fg = "#7f7094" },
        CursorLineNr = { fg = "#19cde6", bold = true },
        CursorLine = { bg = "#3a3a3a" },
        ColorColumn = { bg = "#3a3a3a" },
      },
      palette = {
        bg0 = "#000000",
        bg1 = "#0a0a0a",
        bg2 = "#1a1a1a",
        visual = "#2186ec",
        fg = "#dad9c7",
        gray = "#7f7094",
        pink = "#f841a0",
        red = "#f6188f",
        salmon = "#f97137",
        carrot = "#f85a21",
        cyan = "#12c3e2",
        blue_bright = "#19cde6",
        blue = "#2186ec",
        yellow = "#fdf834",
        green_bright = "#25c141",
        green_dark = "#1ebb2b",
        white = "#ffffff",
        white_bluish = "#dad9c7",
        sand = "#dad9c7",
        purple = "#f6188f",
        diff_green = "#0a1a0f",
        diff_blue = "#0a0f1a",
        diff_diff = "#1a1a1a",
        diff_red = "#1a0a0a",
      },
    })
    synthweave.load()
  end,
}
