-- Neovim color theme

local theme = os.getenv('THEME')
local theme_variant = os.getenv('THEME_VARIANT')

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = theme ~= 'Catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = string.lower(theme_variant or 'macchiato'),
        transparent_background = true,
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'navarasu/onedark.nvim',
    name = 'onedark',
    lazy = theme ~= 'One Dark',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'dark',
        transparent = true,
      })
      vim.cmd.colorscheme('onedark')
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    name = 'gruvbox',
    lazy = theme ~= 'Gruvbox',
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        transparent_mode = true,
      })
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = theme ~= 'Tokyo Night',
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = string.lower(theme_variant or 'night'),
        transparent = true,
      })
      vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = theme ~= 'Rose Pine',
    config = function()
      require('rose-pine').setup({
        variant = string.lower(theme_variant or 'main'),
        styles = {
          transparency = true,
        },
      })
      vim.cmd.colorscheme('rose-pine')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = theme ~= 'Kanagawa',
    config = function()
      local kanagawa_theme = string.lower(theme_variant or 'wave')
      require('kanagawa').setup({
        colors = {
          theme = {
            wave = {
              ui = {
                bg_gutter = '#1F1F28',
              },
            },
          },
        },
        background = {
          dark = kanagawa_theme,
          light = kanagawa_theme,
        },
        -- transparent = true,
      })
      vim.cmd.colorscheme('kanagawa')
    end,
  },
  {
    'lunarvim/horizon.nvim',
    lazy = theme ~= 'Horizon',
    config = function()
      require('horizon').setup({
        transparent = true,
      })
      vim.cmd.colorscheme('horizon')
    end,
  },
  {
    'shaunsingh/nord.nvim',
    lazy = theme ~= 'Nord',
    config = function()
      vim.g.nord_disable_background = true
      require('nord').set()
      vim.cmd.colorscheme('nord')
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    lazy = theme ~= 'Dracula',
    config = function()
      require('dracula').setup({
        transparent_bg = true,
      })
      vim.cmd.colorscheme('dracula')
    end,
  },
}
