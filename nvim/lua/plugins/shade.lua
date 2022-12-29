return {
  'sunjon/shade.nvim',
  config = function()
    require'shade'.setup({
      overlay_opacity = 50,
      opacity_step = 1,
      keys = {
        brightness_up    = '<Leader>k',
        brightness_down  = '<Leader>j',
        toggle           = '<Leader>s',
      }
    })
  end
}
