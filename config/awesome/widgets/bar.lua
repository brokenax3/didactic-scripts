-------------------------
--  Bar for AwesomeWM  --
-------------------------
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local vicious = require("vicious")

local bat_indicator = wibox.widget.textbox()
local volume_indicator = wibox.widget.textbox()
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Create wibox with batwidget
batbox = {
    bat_indicator,
    fg = "#e2a478",
    widget = wibox.container.background,
}

volbox = {
    volume_indicator,
    fg = "#a093c7",
    widget = wibox.container.background,
}

-- Volume widget
vicious.register(volume_indicator, vicious.widgets.volume, 
    function (widget, args)
        if args[2] == "🔈" then
            return "Muted"
        else
            return ("Volume: %d%%"):format(args[1])
        end
    end, 5, "Master")

-- Battery widget
vicious.register(bat_indicator, vicious.widgets.bat,
    function (widget, args)
        local label = { 
            ["↯"] = "Full", 
            ["⌁"] = "Unknown", 
            ["↯"] = "Charged", 
            ["+"] = "Charging", 
            ["-"] = "Discharging"}
        if label[args[1]] == "Unknown" then
            return "No Battery"
        else
            return ("%s: %d%%"):format(label[args[1]], args[2])
        end
    end, 61, "BAT0")

screen.connect_signal("request::wallpaper", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Textclock Widget
    s.mytextclock = wibox.widget.textclock()

    -- Calendar Widget
    s.month_calendar = awful.widget.calendar_popup.month({
        screen = s,
        margin = 5,
    })
    s.month_calendar:attach(s.mytextclock, "tr" )

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            -- awful.button({ }, 4, function () awful.layout.inc(-1) end),
            -- awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            -- awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            -- awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            -- awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            -- awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        },
        style = {shape = gears.shape.rounded_rect},
        layout = {spacing = dpi(8), layout = wibox.layout.flex.horizontal},
        widget_template = {
        {
            {
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 5,
            right = 5,
            widget = wibox.container.margin
        },
        id     = 'background_role',
        widget = wibox.container.background,
        },
    }

    s.menubutton = wibox.widget {
        text = "I'm a button!",
        widget = wibox.widget.textbox
    }
    s.menubutton:buttons(
        awful.button({}, 1, nil, function ()
            require('widgets.menu')
        end)
    )

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox.widget = {
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            -- s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            spacing = 3,
            layout = wibox.layout.fixed.horizontal,
            batbox,
            volbox,
            wibox.widget.systray(),
            s.mytextclock,
            s.mylayoutbox,
            -- s.menubutton,
        },
        spacing = 10,
        layout = wibox.layout.align.horizontal,
    }
end)
