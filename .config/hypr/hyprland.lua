---@module 'hl'
---@diagnostic disable: undefined-global

-- Monitor
hl.monitor({
  output   = "HDMI-A-1",
  mode     = "1920x1080@120",
  position = "0x0",
  scale    = 1,
})
hl.monitor({
  output   = "eDP-1",
  mode     = "1366x768@60",
  position = "1920x0",
  scale    = 1,
})

-- Monitor default
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = 1,
})

-- Input
hl.config({
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    touchpad = {
      disable_while_typing = false,
      tap_to_click = true,
    },
  },
})

-- Envs
-- env = AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", 1)
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("XCURSOR_SIZE", 24)
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 1)
hl.env("QT_ENABLE_HIGHDPI_SCALING", 1)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)

-- Cursor
hl.config({
  cursor = {
    no_hardware_cursors = true,
    enable_hyprcursor = true,
    sync_gsettings_theme = true,
  },
})

-- General
hl.config({
  general = {
    border_size = 2,
    gaps_in = 1,
    gaps_out = 2,
    col = {
      active_border = { colors = { "rgba(89dcebee)", "rgba(9F83C3ee)" }, angle = 225 },
      inactive_border = "rgba(585b70aa)",
    },
  },
})

-- Misc
hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    swallow_regex = "^(wezterm)$",
  },
})

-- Decoration
hl.config({
  decoration = {
    rounding = 0,
    blur = {
      enabled = false,
      size = 1,
      passes = 2,
      new_optimizations = true,
      vibrancy = 0.1696,
    },
    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },
})

-- Group
hl.config({
  group = {
    groupbar = {
      enabled = true,
      font_family = "JetBrainsMono Nerd Font",
      font_size = 10,
      height = 10,
      stacked = false,
      gradients = false,
      render_titles = true,
      col = {
        active = "rgba(89dcebaa)",
        inactive = "rgba(313244aa)",
      },
      text_color = "rgba(cdd6f4ff)",
    },
    col = {
      border_active = { colors = { "rgba(89dcebee)", "rgba(9f83c3ee)" }, angle = 45 },
      border_inactive = "rgba(585b70aa)",
    },
  },
})

-- Animations
hl.config({
  animations = {
    enabled = true,
  },
})

-- Curves
hl.curve("fluent_decel", { type = "bezier", points = { { 0.1, 1 }, { 0.3, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Animation Tree
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "fluent_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "fluent_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "fluent_decel", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "fluent_decel", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "easeOutExpo", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.5, bezier = "fluent_decel", style = "slidevert" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })

-- Layouts
hl.config({
  dwindle = {
    preserve_split = true,
    -- you probably want this
    force_split = 2,
  },
})

-- Window Rules
hl.window_rule({
  float = true,
  match = {
    class = "^(org.qt-project.qml)$",
  },
})

-- Workspace Assignments
hl.window_rule({
  match = {
    class = "^(brave-browser)$",
  },
  workspace = "2 silent",
})
hl.window_rule({
  match = {
    class = "^(discord)$",
  },
  workspace = "3 silent",
})

-- Floating Rules (General Dialogs)
hl.window_rule({
  float = true,
  match = {
    title = "file_progress",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "confirm",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "dialog",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "download",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "notification",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "error",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "splash",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "confirmreset",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "Open File",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "Open Document",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "Open Folder",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "branchdialog",
  },
})

-- Floating Rules (Specific Apps)
hl.window_rule({
  float = true,
  match = {
    class = "^(org.gnome.Nautilus)$",
  },
})
hl.window_rule({
  float = true,
  center = true,
  match = {
    class = "^(org.wezfurlong.wezterm)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    class = "^(blueman-manager)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    class = "^(zoom)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    class = "^(gnome-calculator)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    class = "^(flameshot)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "pavucontrol-qt",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "pavucontrol",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "^(Media Viewer)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "^(Volume Control)$",
  },
})
hl.window_rule({
  float = true,
  match = {
    title = "^(Picture-in-Picture)$",
  },
})

-- Rofi
hl.layer_rule({
  match = {
    namespace = "ignore_alpha 0.6",
  },
  blur = true,
})

-- Waybar
hl.layer_rule({
  match = {
    namespace = "ignore_alpha 0.6",
  },
  blur = true,
})

-- pet
hl.window_rule({
  name        = "border_size_0",
  match       = {
    title = "^(qtpet)$",
  },
  border_size = 0,
})
hl.window_rule({
  match = {
    title = "^(qtpet)$",
  },
  opacity = "1.0 override",
})

-- Discord
hl.window_rule({
  float = true,
  match = {
    class = "^(discord)$",
    title = "^(Discord Updater)$",
  },
})

-- Other
hl.window_rule({
  float = true,
  match = {
    class = "^(tilix)$",
    title = "^(Tilix Preferences)$",
  },
})

-- KeyBind
hl.bind("SUPER" .. " + " .. "Return", hl.dsp.exec_cmd("wezterm"))
hl.bind("SUPER" .. " + " .. "F", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + SHIFT" .. " + " .. "F", hl.dsp.exec_cmd("brave --incognito"))
hl.bind("SUPER" .. " + " .. "B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER" .. " + " .. "D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER" .. " + " .. "W", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER" .. " + " .. "E", hl.dsp.exec_cmd("evince"))
hl.bind("SUPER" .. " + " .. "Space", hl.dsp.exec_cmd("pkill rofi || rofi -show drun --insensitive --allow-images"))
hl.bind("SUPER + SHIFT" .. " + " .. "Return", hl.dsp.window.fullscreen())
hl.bind("SUPER" .. " + " .. "X", hl.dsp.exec_cmd("hyprpicker -a -n"))
hl.bind("SUPER" .. " + " .. "delete", hl.dsp.exec_cmd("loginctl lock-session"))

-- Media Keys
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q set 5%-"))

-- Lock/Unlock KeyBinds
hl.bind("SUPER" .. " + " .. "L", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
  hl.bind("SUPER" .. " + " .. "U", hl.dsp.submap("reset"))
end)

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT" .. " + " .. "Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("CTRL" .. " + " .. "Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- Window Management
hl.bind("SUPER" .. " + " .. "Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT" .. " + " .. "Q", hl.dsp.exit())
hl.bind("SUPER + SHIFT" .. " + " .. "Space", hl.dsp.window.float())
hl.bind("SUPER" .. " + " .. "P", hl.dsp.window.pin())

-- Focus
hl.bind("SUPER" .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER" .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER" .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER" .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

-- Movement
hl.bind("SUPER" .. " + SHIFT + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER" .. " + SHIFT + right", hl.dsp.window.move({ monitor = "r" }))

hl.bind("SUPER" .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER" .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }))

-- Resize
hl.bind("SUPER + CTRL" .. " + " .. "left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("SUPER + CTRL" .. " + " .. "right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind("SUPER + CTRL" .. " + " .. "up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind("SUPER + CTRL" .. " + " .. "down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- Special
hl.bind("SUPER" .. " + " .. "C", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER" .. " + " .. "Z", hl.dsp.workspace.toggle_special(nil))

-- Tabbed (Groups)
hl.bind("SUPER" .. " + " .. "G", hl.dsp.group.toggle())
hl.bind("SUPER" .. " + " .. "TAB", hl.dsp.group.next({ forward = true }))

-- Switch Workspaces
local workspaces_per_monitor = 10
local mainMod = "SUPER"

-- 1. Setup and pin workspace rules per monitor
local function setup_monitor_workspaces(monitor)
  for i = 1, workspaces_per_monitor do
    local global_id = tostring((monitor.id * workspaces_per_monitor) + i)
    hl.workspace_rule({
      workspace = global_id,
      monitor = monitor.name,
      default = (i == 1),
    })
  end
end

-- Run mapping on active screens
for _, monitor in ipairs(hl.get_monitors()) do
  setup_monitor_workspaces(monitor)
end
hl.on("monitor.added", setup_monitor_workspaces)


-- 2. Dynamically assign bindings using corrected, top-level dispatchers
for i = 1, 9 do
  -- Switch relative workspace on active monitor
  hl.bind(mainMod .. " + " .. tostring(i), function()
    local active_monitor = hl.get_active_monitor()
    if active_monitor then
      local target_id = tostring(active_monitor.id * workspaces_per_monitor + i)
      hl.dispatch(hl.dsp.focus({ workspace = target_id }))
    end
  end)

  -- Move focused window to relative workspace on active monitor
  hl.bind(mainMod .. " + SHIFT + " .. tostring(i), function()
    local active_monitor = hl.get_active_monitor()
    if active_monitor then
      local target_id = tostring(active_monitor.id * workspaces_per_monitor + i)
      -- FIX: Use hl.dsp.window.move for moving windows
      hl.dispatch(hl.dsp.window.move({ workspace = target_id }))
    end
  end)
end

-- Mouse Binding
hl.bind("SUPER" .. " + " .. "mouse_down", hl.dsp.exec_cmd("hyprctl dispatch workspace e+1"))
hl.bind("SUPER" .. " + " .. "mouse_up", hl.dsp.exec_cmd("hyprctl dispatch workspace e-1"))

-- Mouse Window Management
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Start
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
  hl.exec_cmd("systemctl --user import-environment wayland_display xdg_current_desktop")
  hl.exec_cmd("hyprpolkitagent")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("udiskie &")
  hl.exec_cmd("sh /home/sumit/.config/hypr/scripts/launch.sh")
  hl.exec_cmd("sh /home/sumit/.config/hypr/scripts/pet.sh")
  hl.exec_cmd("waybar")
  hl.exec_cmd("wezterm")
  hl.exec_cmd("brave")
  hl.exec_cmd("discord")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-mocha-dark-cursors'")
end)
