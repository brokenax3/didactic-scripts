------------------------
--  AwesomeWM Config  --
------------------------
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local ruled = require("ruled")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Theme handling library
beautiful = require("beautiful")


-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Themes
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/iceberg/theme.lua")

-- Bling utility module
local bling = require("bling")

-- Notification
beautiful.notification_font = "Iosevka SS16 11"
beautiful.notification_icon_size = 50
-- beautiful.notification_max_width = 200
-- beautiful.notification_max_height = 200
beautiful.notification_border_width = 10
beautiful.notification_border_color = "#a093c7"
beautiful.notification_fg = "#d2d4de"
beautiful.useless_gap = 2

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

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
