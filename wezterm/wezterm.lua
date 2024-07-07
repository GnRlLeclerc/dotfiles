local wezterm = require('wezterm')

local config = {}

-- Color Scheme
local color_schemes = require('color_schemes')
local color_scheme = color_schemes.tokyo_night_moon
config.color_scheme = color_scheme.wezterm

-- General behavior
config.adjust_window_size_when_changing_font_size = false
config.enable_wayland = true
config.scrollback_lines = 5000
config.use_dead_keys = false
config.warn_about_missing_glyphs = false -- Avoid notifications

-- Font
config.font = wezterm.font({
  family = 'JetBrainsMono Nerd Font',
  harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
})
config.custom_block_glyphs = true
-- Tailored to perfectly fit a neofetch
config.font_size = 11
config.initial_cols = 98
config.initial_rows = 31

-- Window decorations
config.window_decorations = 'NONE' -- "TITLE | RESIZE"

-- Background
config.window_background_opacity = 1

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = 0,
  bottom = 0,
}

-- Tab & scroll
config.enable_scroll_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800
config.animation_fps = 30
config.cursor_blink_ease_in = 'Linear'
config.cursor_blink_ease_out = 'Linear'
config.force_reverse_video_cursor = true -- Better integration with theme

-- Export environment variables for theme synchronization
config.set_environment_variables = {
  THEME = color_scheme.name,
  THEME_VARIANT = color_scheme.variant,
}

-- Wezterm Neovim Zen Mode
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == 'ZEN_MODE' then
    local incremental = value:find('+')
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

return config
