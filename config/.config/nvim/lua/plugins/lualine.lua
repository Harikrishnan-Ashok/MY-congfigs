return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
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
            mode = 2,
            max_length = vim.o.columns,
            show_modified_status = true,
            tabs_color = {
              active = { bg = '#61afef', fg = '#282c34' },
              inactive = { bg = '#3e4452', fg = '#abb2bf' },
            },
          },
        },
      },
      extensions = {}
    }
  end
}

