-- In-editor markdown rendering. Replaces the old browser-based markdown-preview.
-- Must not be lazy-loaded: the plugin lazy-loads itself internally.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
}
