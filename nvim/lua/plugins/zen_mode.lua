return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  keys = { { '<leader>z', ':ZenMode<CR>', desc = 'Zen mode' } },
  opts = {
    window = {
      options = {
        foldcolumn = '0', -- Hide fold column
      },
    },
    plugins = {
      twilight = { enabled = false },
    },

    on_open = function()
      vim.cmd('IBLDisable')
      vim.g.miniindentscope_disable = true
    end,
    on_close = function()
      vim.cmd('IBLEnable')
      vim.g.miniindentscope_disable = false
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:╱]] -- Restore clean fold style and nice diff style
    end,
  },
}

-- For tmux: set-option -g allow-passthrough on
