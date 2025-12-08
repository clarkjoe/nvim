return {
  'morhetz/gruvbox',
  lazy = false,
  priority = 1000,
  config = function()
    -- Your gruvbox configuration here
    vim.g.gruvbox_contrast_dark = 'medium'
    vim.g.gruvbox_italic = 1
    vim.cmd([[colorscheme gruvbox]])
    vim.opt.background = 'dark'
  end,
}
