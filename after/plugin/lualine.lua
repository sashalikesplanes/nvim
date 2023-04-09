local mark = require('harpoon.mark')

local function create_harpoon_file_funcs()
  local function basename(file_path)
    return file_path:match("([^/]+)$")
  end

  local function get_file_name(i)
    local file = mark.get_marked_file_name(i)

    if file == nil then
      return '...'
    end

    return basename(file)
  end

  local funcs = {}

  for i = 1, 9 do
    funcs[i] = function()
      return tostring(i) .. ' ' .. get_file_name(i)
    end
  end

  return funcs
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
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
  tabline = {
    lualine_a = {},
    lualine_b = create_harpoon_file_funcs(),
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
