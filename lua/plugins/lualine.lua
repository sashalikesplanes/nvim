local HARPOON_BUFFERS = 5

local function create_harpoon_file_funcs(mark)
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

  for i = 1, HARPOON_BUFFERS do
    funcs[i] = function()
      return tostring(i) .. ' ' .. get_file_name(i)
    end
  end

  return funcs
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "theprimeagen/harpoon" },
    config = function()
      local line = require('lualine')

      line.setup {
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
          lualine_c = {'filename'},
          lualine_x = {'location'},
        },
        tabline = {
          lualine_c = create_harpoon_file_funcs(require("harpoon.mark")),
        },
      }
      require('harpoon.mark').on('changed', function ()
        line.refresh({ scope = 'tabpage', place = { 'tabline' } })   
      end)
    end,
  }
}
