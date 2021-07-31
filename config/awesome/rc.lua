------------------------
--  AwesomeWM Config  --
------------------------
-- Standard awesome library
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local ruled = require("ruled")
require("awful.autofocus")

-- Theme handling library
beautiful = require("beautiful")

-- Themes
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/gruvbox/theme.lua")

-- Custom Widgets
-- require("widgets.volume")
--require("widgets.brightness")

-- Error handling
require("utils.error")

-- Layout
require("utils.layout")

-- Wibar
require("widgets.bar")

-- Autostart Applications
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- Key bindings
require("utils.keys")

-- Rules
require("utils.rules")

-- Notifications
require("utils.notification")

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
