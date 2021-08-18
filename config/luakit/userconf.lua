-- Settings for luakit browser
local settings = require "settings"
local modes = require "modes"
local adblock = require "adblock"
local adblock_chrome = require "adblock_chrome"
local webview = require "webview"

settings.application.prefer_dark_mode = true
settings.window.home_page = "www.google.com"
settings.webview.hardware_acceleration_policy = "always"
settings.webview.enable_caret_browsing = true
settings.webview.enable_dns_prefetching = true
settings.webview.enable_webaudio = true
settings.webview.enable_webgl = true
settings.webview.enable_media_stream = true
settings.webview.enable_smooth_scrolling = true
settings.window.reuse_new_tab_pages = true

-- Adblock
-- adblock.load(true, "adblock/easylist.txt", true)

-- Keybindings
modes.remap_binds("normal", -- This is the mode in which the bindings are active.
  {
      -- Capital O opens link in a new tab
     {"O", "t", true},
     {"H", "<Back>", false},
  })

-- Open links in other applications
webview.add_signal("init", function (view)
    view:add_signal("navigation-request", function (v, uri)
        --- Check URI and open program here
        if string.match(string.lower(uri), "^magnet:") then
            luakit.spawn(string.format("%s %q", "deluge-gtk", uri))
            return false
        end
    end)
end)
