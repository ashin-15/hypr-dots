local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.layout("togglesplit"))
hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd(noctCall .. "session lock-and-suspend"))

-- Change focus
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { workspace = 2 })
-- hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { workspace = 2 })
-- hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"), { workspace = 1 })
-- hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"), { workspace = 1 })

local function layout_focus(direction)
	return function()
		local workspace = hl.get_active_workspace()

		if not workspace then
			return
		end

		if workspace.tiled_layout == "scrolling" then
			hl.dispatch(hl.dsp.layout("focus " .. direction))
		elseif workspace.tiled_layout == "dwindle" then
			hl.dispatch(hl.dsp.focus({ direction = direction }))
		end
	end
end

hl.bind(mainMod .. " + H", layout_focus("l"))
hl.bind(mainMod .. " + L", layout_focus("r"))

-- Move active window around current workspace
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Vim-style bindings with Shift (H, J, K, L)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

-- Drag window using right key of mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
-- Resize windows using left key of mouse
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date +"%Y-%m-%d_%H-%M-%S").png"'))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(noctCall .. "plugin alexander/screen-toolkit:service all toggle"))

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + CONTROL + ALT + Right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + ALT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
