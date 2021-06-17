local awful = require("awful")
local ruled = require("ruled")
local wibox = require("wibox")
local gears = require("gears")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { -- border_width = beautiful.border_width,
                     -- border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
        },
        class = {
            "Arandr",
            "Blueman-manager",
            "Pamac-manager", 
            "Lxappearance", 
            "SimpleScreenRecorder", 
            "Pavucontrol" ,
            "fcitx5-config-qt"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
            "Event Tester",  -- xev.
        },
        role = {
            "AlarmWindow",  -- Thunderbird's calendar.
            "ConfigManager",  -- Thunderbird's about:config.
            "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        } }, 
        properties = { 
            placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
            floating = true,
            ontop = true,
        }
    },

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
        properties = { floating = true, width = 530, height = 315 }
    },

    { rule = { class = "MATLAB R2020a.*", name = "Figure.*" },
        properties = { floating = true, ontop = true, width = 450, height = 450 }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = { type = { "floating", "dialog" } }, 
        properties = { 
            ontop = true,
        }
    },

}

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
client.connect_signal("manage", function(c)
    c.shape = function(cr,w,h)
        gears.shape.rounded_rect(cr,w,h,10)
    end

end)

client.connect_signal("property::fullscreen", function(c)
    if c.fullscreen == true then
        c.shape = function(cr,w,h)
            gears.shape.rectangle(cr,w,h)
        end
    else
        c.shape = function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,10)
        end
    end
end)
-- client.connect_signal("property::floating", function(c)

--     if c.floating == true then
--         c.ontop = true
--     end
-- end)


