---------------------------------
--  Keybindings for AwesomeWM  --
---------------------------------
local awful = require("awful")
local naughty = require("naughty")
local vicious = require("vicious")

-- Enable hotkeys help widget for VIM and other apps
local hotkeys_popup = require("awful.hotkeys_popup")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

--  Mouse bindings
-- awful.mouse.append_global_mousebindings({
--     awful.button({ }, 4, awful.tag.viewprev),
--     awful.button({ }, 5, awful.tag.viewnext),
-- })

-- Variable Definitions
-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Exit
local exitAwesome = awful.menu({
    items = {
        { "Exit", function() awesome.quit() end },
        { "Lock", function() awful.spawn.with_shell("locker") end },
        { "Reboot", function() awful.spawn.with_shell("reboot") end },
        { "Suspend", function() awful.spawn.with_shell("locker && systemctl suspend") end },
        { "Shutdown", function() awful.spawn.with_shell("shutdown now") end },
    }
})

-- General Keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

})

-- {{{ Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})
-- }}}

-- {{{ Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})
-- }}}

-- {{{ Master Layout Manipulation
-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    -- awful.key({ modkey,           }, "q", function () bling.module.tabbed.put()              end,
              -- {description = "pick client to add to tab", group = "layout"}),
    -- awful.key({ modkey,           }, "e", function () bling.module.tabbed.pop()               end,
              -- {description = "pop client from tab", group = "layout"}),
    -- awful.key({ modkey,           }, "w", function () bling.module.tabbed.iter()              end,
              -- {description = "iterate through clients in tab", group = "layout"}),
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)

-- }}}

-- {{{ Standard Shortcuts
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "c", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    -- Volume Keys
    awful.key({ }, "XF86AudioLowerVolume", function () 
        awful.spawn.easy_async("pamixer -d 5 && pamixer --get-volume-human", function(stdout, stderr, reason, exit_code)
        vicious.force(volbox)
        naughty.notification({ title = "Volume: " ..  stdout, timeout = 1 })
        end)
    end),

    awful.key({ }, "XF86AudioRaiseVolume", function () 
        awful.spawn.easy_async("pamixer -i 5 && pamixer --get-volume-human", function(stdout, stderr, reason, exit_code)
        vicious.force(volbox)
        naughty.notification({ title = "Volume: " ..  stdout, timeout = 1 })
        end)
    end),

    awful.key({ }, "XF86AudioMute", function () 
        awful.spawn.easy_async("pamixer -t && pamixer --get-mute", function(stdout, stderr, reason, exit_code)
        vicious.force(volbox)
        naughty.notification({ title = "Muted: " ..  stdout, timeout = 1 })
        end)
    end),

    -- Brightness Keys
    awful.key({ }, "XF86MonBrightnessDown", function () 
        awful.spawn("xbacklight -dec 5")
        naughty.notification({ title = "Brightness Down", timeout = 1 })
    end),

    awful.key({ }, "XF86MonBrightnessUp", function () 
        awful.spawn("xbacklight -inc 5")
        naughty.notification({ title = "Brightness Up", timeout = 1 })
    end),
    
    -- Screenshot
    awful.key({ modkey , "Shift" }, "s", function () 
        awful.spawn.with_shell("maim -s --hidecursor ~/Pictures/$(date '+%s').png")
    end,
    {description = "Screenshot with selection", group = "launcher"}),
    awful.key({ modkey , "Shift" }, "a", function () 
        awful.spawn.easy_async_with_shell("maim -s --hidecursor --format png /dev/stdout | xclip -selection clipboard -t image/png")
    end,
    {description = "Screenshot with selection to clipboard", group = "launcher"}),

    --  Rofi
    awful.key({ modkey,           }, "d", function () awful.spawn("rofi -show run") end,
              {description = "rofi -show run", group = "rofi"}),
    awful.key({ modkey,           }, "x", function () awful.spawn("rofi -show drun") end,
              {description = "rofi -show drun", group = "rofi"}),
    awful.key({ modkey,           }, "a", function () awful.spawn("rofi -show window") end,
              {description = "rofi -show window", group = "rofi"}),
    -- awful.key({ modkey,           }, "t", function () awful.spawn("rofi -show find -modi find:/usr/local/bin/rofi-finder -width 40 -lines 20") end,
    --           {description = "rofi -show find", group = "rofi"}),
})
-- }}}

-- {{{ Custom Shortcuts
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "F2", function () awful.spawn("google-chrome-stable") end,
              {description = "Google Chrome", group = "applications"}),
    awful.key({ modkey,           }, "F3", function () awful.spawn("thunar") end,
              {description = "Thunar", group = "applications"}),
    awful.key({ modkey,           }, "F4", function () awful.spawn("neovide") end,
              {description = "Neovim", group = "applications"}),
    awful.key({ modkey,           }, "F5", function () awful.spawn("google-chrome-stable --incognito") end,
              {description = "Google Chrome (Incognito Mode)", group = "applications"}),
    awful.key({ modkey,           }, "F6", function () awful.spawn("spotify") end,
              {description = "Spotify", group = "applications"}),

    awful.key({ modkey,           }, "F9", function () awful.spawn("pavucontrol") end,
              {description = "Pavucontrol", group = "applications"}),
    awful.key({ modkey, "Shift"   }, "w", function () awful.spawn("google-chrome-stable https://web.whatsapp.com/") end,
              {description = "Whatsapp Web", group = "applications"}),

    -- Power Menu
    awful.key({ modkey }, "0", function() exitAwesome:show() end,
            {description = "Power off options", group = "launcher"}),

})
-- }}}
