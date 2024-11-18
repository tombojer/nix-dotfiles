local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13.0
config.pane_focus_follows_mouse = true
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_dead_keys = true
config.adjust_window_size_when_changing_font_size = false
config.front_end = "WebGpu"
config.webgpu_power_preference = 'HighPerformance'


-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
    if wezterm.gui then
      return wezterm.gui.get_appearance()
    end
    return 'Dark'
  end
  
function scheme_for_appearance(appearance)
if appearance:find 'Dark' then
    return 'Kanagawa (Gogh)'
else
    return 'Google Light (Gogh)'
end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.keys = {{
    key = "p",
    mods = "CMD",
    action = action.SendKey {
      key = "p",
      mods = "CTRL"
    }
}, {
    key = 'n',
    mods = 'CMD',
    action = action.SendKey {
        key = 'n',
        mods = 'CTRL'
    }
}, {
    key = 'u',
    mods = 'CMD',
    action = action.SendKey {
        key = 'u',
        mods = 'CTRL'
    }
}, {
    key = 'l',
    mods = 'CMD',
    action = action.SendKey {
        key = 'l',
        mods = 'CTRL'
    }
}, {
    key = 'c',
    mods = 'CMD',
    action = action.SendKey {
        key = 'c',
        mods = 'CTRL'
    }
}, {
    key = 'C',
    mods = 'CMD',
    action = action.CopyTo 'Clipboard'
}, {
    mods = "OPT",
    key = "LeftArrow",
    action = action.SendKey({
        mods = "ALT",
        key = "b"
    })
}, {
    mods = "OPT",
    key = "RightArrow",
    action = action.SendKey({
        mods = "ALT",
        key = "f"
    })
}, {
    mods = "CMD",
    key = "LeftArrow",
    action = action.SendKey({
        mods = "CTRL",
        key = "a"
    })
}, {
    mods = "CMD",
    key = "RightArrow",
    action = action.SendKey({
        mods = "CTRL",
        key = "e"
    })
}, {
    mods = "CMD",
    key = "Backspace",
    action = action.SendKey({
        mods = "CTRL",
        key = "u"
    })
}}

return config
