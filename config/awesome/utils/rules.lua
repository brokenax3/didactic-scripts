local awful = require("awful")
local ruled = require("ruled")
local gears = require("gears")

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
     -- All clients will match this rule.
     ruled.client.append_rule {
         id         = "global",
         rule       = { },
         properties = {
             focus     = awful.client.focus.filter,
             raise     = true,
             screen    = awful.screen.preferred,
             placement = awful.placement.no_overlap+awful.placement.no_offscreen
         }
     }

     -- Floating clients.
     ruled.client.append_rule {
         id       = "floating",
         rule_any = {
             instance = { "copyq", "pinentry" },
             class    = {
                 "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                 "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer", 
                 "Lxappearance", "SimpleScreenRecorder", "Pavucontrol" ,
                 "fcitx5-config-qt", "Vimiv", "Gcolor3",
             },
             -- Note that the name property shown in xprop might be set slightly after creation of the client
             -- and the name shown there might not match defined rules here.
             name    = {
                 "Event Tester",  -- xev.
             },
             role    = {
                 "AlarmWindow",    -- Thunderbird's calendar.
                 "ConfigManager",  -- Thunderbird's about:config.
                 "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
             }
         },
         properties = { floating = true }
     }

     -- Add titlebars to normal clients and dialogs
     ruled.client.append_rule {
         id         = "titlebars",
         rule_any   = { type = { "floating", "dialog" } },
         properties = { titlebars_enabled = true      }
     }

     -- Set Firefox to always map on the tag named "2" on screen 1.
     ruled.client.append_rule {
         rule       = { class = "Firefox"     },
         properties = { screen = 1, tag = "2" }
     }
    
     ruled.client.append_rule {
         { rule = { class = "Pavucontrol" },
             properties = { width = 740, height = 315 }
         },
        
         { rule = { class = "fcitx5-config-qt" },
             properties = { width = 480, height = 600 }
         },

         { rule = { class = "SimpleScreenRecorder" },
             properties = { width = 555, height = 315 }
         },

         { rule = { class = "zoom", name = "Chat" },
             properties = { floating = true, ontop = true, width = 530, height = 315 }
         },

         { rule = { class = "Vimiv" },
             properties = { floating = true, width = 480, height = 480 }
         },

         { rule = { class = "Gcolor3" },
             properties = { floating = true, width = 700, height = 305 }
         },

         { rule = { class = "MATLAB R2020a.*", name = "Figure.*" },
             properties = { floating = true, ontop = true, width = 450, height = 450 }
         }
     }
 end)

 -- {{{ Titlebars
 -- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
     -- buttons for the titlebar
     local buttons = {
         awful.button({ }, 1, function()
             c:activate { context = "titlebar", action = "mouse_move"  }
         end),
         awful.button({ }, 3, function()
             c:activate { context = "titlebar", action = "mouse_resize"}
         end),
     }

     awful.titlebar(c).widget = {
         { -- Left
             awful.titlebar.widget.iconwidget(c),
             buttons = buttons,
             layout  = wibox.layout.fixed.horizontal
         },
         { -- Middle
             { -- Title
                 align  = "center",
                 widget = awful.titlebar.widget.titlewidget(c)
             },
             buttons = buttons,
             layout  = wibox.layout.flex.horizontal
         },
         { -- Right
             awful.titlebar.widget.floatingbutton (c),
             awful.titlebar.widget.maximizedbutton(c),
             awful.titlebar.widget.stickybutton   (c),
             awful.titlebar.widget.ontopbutton    (c),
             awful.titlebar.widget.closebutton    (c),
             layout = wibox.layout.fixed.horizontal()
         },
         layout = wibox.layout.align.horizontal
     }
 end)

-- {{{ Client Windows
-- client.connect_signal("property::floating", function(c)
--     if c.floating == true then
--         c.above = true
--     elseif c.floating == false then
--         c.above = false
--     end
-- end)

-- client.connect_signal("property::fullscreen", function(c)
--   if c.fullscreen then
--     gears.timer.delayed_call(function()
--       if c.valid then
--         c:geometry(c.screen.geometry)
--       end
--     end)
--   end
-- end)
-- client.connect_signal("property::maximized", function(c)
--     if c.maximused == true then
--         c.fullscreen = true
--     end
-- end)

