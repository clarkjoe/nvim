return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
       end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next hunk")
      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Previous hunk")

      map("n", "<leader>gSs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>gSr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gSs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selected hunk")
      map("v", "<leader>gSr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selected hunk")
      map("n", "<leader>gSp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gSS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gSR", gs.reset_buffer, "Reset buffer")
    end,
  },
}
