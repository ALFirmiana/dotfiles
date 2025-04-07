-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux
-- 透明背景
config.window_background_opacity = 0.6
--取消默认任务栏
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
wezterm.on("format-window-title", function()
    local title = "(<ゝω・) 綺羅星☆ "
	return title
end)
--关闭时不进行确认
config.window_close_confirmation = "NeverPrompt"

config.enable_wayland = false

--指定字体
config.font = wezterm.font_with_fallback({
    "Maple Mono NF CN",
	"Noto Sans Mono CJK SC",
	"JetBrains Mono",
})
config.font_size = 18

--指定配色
config.color_scheme = "Catppuccin Macchiato"

--全屏启动
--wezterm.on('gui-startup', function(window)
--  local tab, pane, window = mux.spawn_window{}
--  local gui_window = window:gui_window();
--gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
--  gui_window:maximize()
--end)

config.native_macos_fullscreen_mode = true

config.audible_bell = "Disabled"

--取消热键
config.disable_default_key_bindings = true

--设置自定义快捷键
local act = wezterm.action
config.keys = {
	-- Ctrl+Shift+Tab 遍历 tab
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(1) },
	-- F11 切换全屏
	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
	-- Ctrl+Shift++ 字体增大
	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	-- Ctrl+Shift+- 字体减小
	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
	-- Ctrl+Shift+C 复制选中区域
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	-- Ctrl+Shift+N 新窗口
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	-- Ctrl+Shift+T 新 tab
	{ key = "T", mods = "SHIFT|CTRL", action = act.ShowLauncher },
	-- Ctrl+Shift+V 粘贴剪切板的内容
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	-- Ctrl+Shift+W 关闭 tab 且不进行确认
	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	-- Ctrl+Shift+PageUp 向上滚动一页
	{ key = "PageUp", mods = "SHIFT|CTRL", action = act.ScrollByPage(-1) },
	-- Ctrl+Shift+PageDown 向下滚动一页
	{ key = "PageDown", mods = "SHIFT|CTRL", action = act.ScrollByPage(1) },
	-- Ctrl+Shift+UpArrow 向上滚动一行
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ScrollByLine(-1) },
	-- Ctrl+Shift+DownArrow 向下滚动一行
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ScrollByLine(1) },
	-- Ctrl+Alt+\ 水平分栏
	{ key = "\\", mods = "CTRL|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- Ctrl+Alt+/ 垂直分栏
	{ key = "/", mods = "CTRL|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- Ctrl+Alt+- 关闭窗格
	{ key = "-", mods = "CTRL|ALT", action = act.CloseCurrentPane({ confirm = false }) },
	-- 切换窗格
	{ key = "h", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "l", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") },
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config
