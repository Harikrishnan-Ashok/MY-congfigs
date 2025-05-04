require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 2,  -- Shows tab name with full path
        max_length = vim.o.columns, -- Use full available width
        show_modified_status = true,
        tabs_color = {
          active = { bg = '#61afef', fg = '#282c34' },    -- Blue background with dark text
          inactive = { bg = '#3e4452', fg = '#abb2bf' },  -- Dark background with light text
        },
      },
    },
  },
  extensions = {}
}
