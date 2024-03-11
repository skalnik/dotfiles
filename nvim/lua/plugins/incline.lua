local M = {
  "b0o/incline.nvim",
  event = "BufReadPre",
}

function M.config()
  local colors = require("onedark.palette").dark
  require("incline").setup({
    highlight = {
      groups = {
        InclineNormal = {
          guibg = colors.bg_blue,
          guifg = colors.bg0,
        },
        InclineNormalNC = {
          guibg = colors.bg,
          guifg = colors.bg3,
        },
      },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)
      return {
        { icon, guifg = color },
        { "  " },
        { filename },
      }
    end,
  })
end

return {}
