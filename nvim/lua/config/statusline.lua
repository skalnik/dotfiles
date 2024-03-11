-- My minimal custom statusline with lots of help from
--   https://jip.dev/posts/a-simpler-vim-statusline/
--   https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local function termcode(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Output the content colored by the supplied highlight group.
local function color(highlight_group, content)
  return string.format('%%#%s#%s%%*', highlight_group, content)
end

local mode_colors = {
  n = 'Normal',
  i = 'Insert',
  R = 'Replace',
  v = 'Visual',
  V = 'Visual',
  [termcode '<c-v>'] = 'Visual',
  c = 'Command',

  s = 'Normal',
  S = 'Normal',
  [termcode '<c-s>'] = 'Normal',
  t = 'Normal',
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = string.format('Statusline%s', (mode_colors[current_mode] or 'Normal'))
  return color(mode_color, '▎')
end

local function icon()
  local file_name = vim.fn.expand '%:p:t'
  local extension = vim.fn.expand '%:e'

  local the_icon, highlight = require('nvim-web-devicons').get_icon(file_name, extension)

  if not the_icon and #file_name == 0 then
    -- Is in a folder
    the_icon = ''
    highlight = 'Accent'
  end

  return color(string.format('Statusline%s', highlight or 'Accent'), the_icon or '●')
end

local function file_name()
  local file_path = '%{expand("%:p:h:t")}/%{expand("%:p:t")}'

  return string.format('%s %%<%s %s', color('StatuslineAccent', '»'), file_path, color('StatuslineAccent', '«'))
end

local function file_modified()
  if vim.bo.modified then
    return color('StatuslineBoolean', '+')
  end

  return nil
end

local function file_read_only()
  if vim.bo.readonly then
    return color('StatuslineBoolean', '‼')
  end

  return nil
end

local test_status_symbols = {
  running = '…',
  pass = '✔',
  fail = '✖',
}

local test_status_colors = {
  running = 'StatuslinePending',
  pass = 'StatuslineSuccess',
  fail = 'StatuslineError',
}

local function search_count()
  local searchcount = vim.fn.searchcount()
  if vim.v.hlsearch > 0 and searchcount.total > 0 then
    return color('StatuslineSuccess', string.format('%s/%s', searchcount.current, searchcount.total))
  end

  return nil
end

local function macro_recording()
  return nil
end

local function plugin_updates()
  if require('lazy.status').has_updates() then
    return color('StatuslineBlue', require('lazy.status').updates())
  end

  return nil
end

local function lsp_status()
  local errors = vim.diagnostic.get(0, { severity = 1 })
  local warnings = vim.diagnostic.get(0, { severity = 2 })
  local symbols = require("config/symbols").lsp

  local messages = {}
  if #errors ~= 0 then
    table.insert(messages, color('StatuslineError', symbols.Error .. ' ' .. #errors))
  end
  if #warnings ~= 0 then
    table.insert(messages, color('StatuslineWarning', symbols.Warn .. ' ' .. #warnings))
  end

  return table.concat(messages, ' ')
end

function _G.statusline()
  local sections = {
    mode(),
    icon(),
    '',
    file_name(),
    file_modified(),
    file_read_only(),
    -- Right side
    '%=',
    macro_recording(),
    plugin_updates(),
    lsp_status(),
    ' ',
  }

  return table.concat(
    vim.tbl_filter(function(section)
      return section
    end, sections),
    ' '
  )
end

--vim.o.statusline = '%!v:lua.statusline()'

-- Use a global statusline for all windows
vim.opt.laststatus = 3
