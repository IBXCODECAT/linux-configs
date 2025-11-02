local theme = require('lualine.themes.onedark')

local colors = {
	-- Normal Mode: Blue
  normal_mode_bg = '#0088FF', -- A nice blue
  normal_mode_fg = '#ffffff',

  -- Insert Mode: Green
  insert_mode_bg = '#00AA00', -- A nice green
  insert_mode_fg = '#ffffff',

  -- Visual Mode: Purple
  visual_mode_bg = '#CC00FF', -- A nice purple
  visual_mode_fg = '#ffffff',

  -- Command Mode: Reddish
  command_mode_bg = '#cc0000', -- A reddish-brown
  command_mode_fg = '#ffffff',
}

theme.normal.a = {
	fg = colors.normal_mode_fg,
	bg = colors.normal_mode_bg,
	gui = 'bold'
}

theme.insert.a = {
  fg = colors.insert_mode_fg,
  bg = colors.insert_mode_bg,
  gui = 'bold'
}

theme.visual.a = {
  fg = colors.visual_mode_fg,
  bg = colors.visual_mode_bg,
  gui = 'bold'
}

theme.command.a = {
  fg = colors.command_mode_fg,
  bg = colors.command_mode_bg,
  gui = 'bold'
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
	{
		'diagnostics',
		sources = { 'nvim_lsp' },
		sections = { 'error', 'warn' },
		colored = true,
		symbols = { error = '🕱', warn = '⚠ ' },
	}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
