-- Vim options
-- In particular, contains some options that need to be loaded before lazy

-- Start scrolling 5 lines before hitting the edge of the screen with the cursor
vim.o.scrolloff = 5

-- Use sytem clipboard
vim.opt.clipboard = 'unnamedplus'

-- Default indentation settings
-- Set tab width to 2 spaces
vim.opt.tabstop = 2
-- Set tab movement size
vim.opt.softtabstop = 2
-- Set shift width to 2 spaces
vim.opt.shiftwidth = 2
-- Set expandtab to convert tabs to spaces
vim.opt.expandtab = true
-- Map <leader> to space BEFORE loading lazy
vim.g.mapleader = ' '

-- Enable line numbers
vim.wo.number = true

-- Enable relative line numbers
vim.wo.relativenumber = true

-- Folding options
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:╱]] -- Clean fold style and nice diff style

-- Use 24 bit colors for nvim-notify fade in-out
vim.opt.termguicolors = true
vim.opt.pumheight = 10 -- Limit max completions height

-- Set language to English
vim.cmd('language en_US')

-- Set LSP diagnostic icons
local symbols = { Error = '󰅙', Info = '󰋼', Hint = '󰌵', Warn = '' }

for name, icon in pairs(symbols) do
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

-- Open a diagnostic window to show the full diagnostic
-- Can also be inspected using trouble.nvim
local showDiagnostic = function()
  local opts = {
    focusable = false,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    border = 'rounded',
    source = 'always', -- This shows the source of the diagnostic
    prefix = ' ',
    scope = 'cursor', -- Shows diagnostics for the current cursor position
  }
  vim.diagnostic.open_float(nil, opts)
end

-- Set the keymap to call the global function
vim.keymap.set('n', '<leader>d', showDiagnostic, { noremap = true, silent = true })

-- Update conceal level in my Obsidian notes directory
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  pattern = '*',
  callback = function()
    if string.match(vim.fn.expand('%:p:h'), '/Notes$') then
      vim.opt.conceallevel = 1
    end
  end,
})

-- Disable syntax highlighting when opening large files in a buffer (> 100KB)
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = '*',
  callback = function()
    if vim.fn.getfsize(vim.fn.expand('%:p')) > 100 * 1024 then
      vim.cmd('syntax clear')
    end
  end,
})
