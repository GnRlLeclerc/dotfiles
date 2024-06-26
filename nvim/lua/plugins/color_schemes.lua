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
      if theme == 'Catppuccin' then
        vim.cmd.colorscheme('catppuccin')
      end
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
      if theme == 'One Dark' then
        vim.cmd.colorscheme('onedark')
      end
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
      if theme == 'Gruvbox' then
        vim.cmd.colorscheme('gruvbox')
      end
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
      if theme == 'Tokyo Night' then
        vim.cmd.colorscheme('tokyonight')
      end
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
      if theme == 'Rose Pine' then
        vim.cmd.colorscheme('rose-pine')
      end
    end,
  },
  {
    -- This is my fork of the original in order to remove the lighter background color for statuscol
    'GnRlLeclerc/kanagawa.nvim',
    lazy = theme ~= 'Kanagawa',
    config = function()
      require('kanagawa').setup({
        transparent = true,
        theme = string.lower(theme_variant or 'wave'),
      })
      if theme == 'Kanagawa' then
        vim.cmd.colorscheme('kanagawa')
      end
    end,
  },
  {
    'lunarvim/horizon.nvim',
    lazy = theme ~= 'Horizon',
    config = function()
      require('horizon').setup({
        transparent = true,
      })
      if theme == 'Horizon' then
        vim.cmd.colorscheme('horizon')
      end
    end,
  },
  {
    'shaunsingh/nord.nvim',
    lazy = theme ~= 'Nord',
    config = function()
      vim.g.nord_disable_background = true
      require('nord').set()
      if theme == 'Nord' then
        vim.cmd.colorscheme('nord')
      end
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    lazy = theme ~= 'Dracula',
    config = function()
      require('dracula').setup({
        transparent_bg = true,
      })
      if theme == 'Dracula' then
        vim.cmd.colorscheme('dracula')
      end
    end,
  },
}
