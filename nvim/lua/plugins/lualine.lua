-- Status bar
local theme = os.getenv('THEME')
local variant = os.getenv('THEME_VARIANT')
local lualine_theme = 'nightfly'

if theme == 'Kanagawa' then
  lualine_theme = 'kanagawa'
elseif theme == 'Tokyo Night' then
  lualine_theme = 'tokyonight'
elseif theme == 'One Dark' then
  lualine_theme = 'onedark'
elseif theme == 'Gruvbox' then
  lualine_theme = 'gruvbox'
elseif theme == 'Catppuccin' then
  lualine_theme = string.format('catppuccin-%s', string.lower(variant or 'macchiato'))
elseif theme == 'Rose Pine' then
  lualine_theme = 'rose-pine'
elseif theme == 'Horizon' then
  lualine_theme = 'horizon'
elseif theme == 'Nord' then
  lualine_theme = 'nord'
elseif theme == 'Dracula' then
  lualine_theme = 'dracula-nvim'
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },

  event = 'BufRead', -- Triggers Copilot loading when a buffer is read, disabling it in the alpha.nvim startup screen
  config = function()
    require('lualine').setup({
      extensions = { 'neo-tree' },
      options = {
        theme = lualine_theme,
        section_separators = { left = '', right = '' },
        -- ignore_focus = { "neo-tree" },
      },
      sections = {
        -- Left part of lualine
        lualine_a = { 'mode' },
        lualine_b = {
          'filetype',
          { 'filename', icon = { '󰑃', align = 'right' } },
        },
        lualine_c = { 'branch', 'diff' },

        -- Right part of lualine
        lualine_x = {},
        lualine_y = { 'diagnostics', 'copilot', 'encoding', 'fileformat' },
        lualine_z = { { 'progress', icon = '' }, 'location' },
      },
    })
  end,
}
