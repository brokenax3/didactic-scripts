-------------------------
--  Iceberg AwesomeWM  --
-------------------------

local themes_path = require("gears.filesystem").get_configuration_dir() .. "/themes/"
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "/iceberg/background.png"
-- }}}

-- {{{ Styles
theme.font      = "Iosevka SS16 11"
-- }}}

-- {{{ Colors
theme.fg_normal  = "#d2d4de"
theme.fg_focus   = "#161821"
theme.fg_urgent  = "#161821"
theme.bg_normal  = "#161821"
theme.bg_focus   = "#84a0c6"
theme.bg_urgent  = "#e27878"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_normal = "#161821"
theme.border_focus  = "#89b8c2"
theme.border_marked = "#a093c7"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#161821"
theme.titlebar_bg_normal = "#161821"
-- }}}

-- {{{ Titlebars
-- For tabbed only
theme.tabbed_spawn_in_tab = true           -- whether a new client should spawn into the focused tabbing container

-- For tabbar in general
theme.tabbar_ontop  = true
theme.tabbar_radius = 0                     -- border radius of the tabbar
theme.tabbar_style = "default"              -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = "Iosevka SS16 11"       -- font of the tabbar
theme.tabbar_size = 20                      -- size of the tabbar
theme.tabbar_position = "top"               -- position of the tabbar
theme.tabbar_bg_normal = "#000000"          -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = "#ffffff"          -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus  = "#1A2026"          -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus  = "#ff0000"          -- foreground color of unfocused clients on the tabbar

-- the following variables are currently only for the "modern" tabbar style
theme.tabbar_color_close = "#f9929b"        -- chnges the color of the close button
theme.tabbar_color_min   = "#fbdf90"        -- chnges the color of the minimize button
theme.tabbar_color_float = "#ccaced"        -- chnges the color of the float button

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}


-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"


-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "iceberg/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "iceberg/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "iceberg/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}
--
-- {{{ Layout
theme.layout_tile       = themes_path .. "iceberg/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "iceberg/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "iceberg/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "iceberg/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "iceberg/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "iceberg/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "iceberg/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "iceberg/layouts/dwindle.png"
theme.layout_max        = themes_path .. "iceberg/layouts/max.png"
theme.layout_fullscreen = themes_path .. "iceberg/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "iceberg/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "iceberg/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "iceberg/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "iceberg/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "iceberg/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "iceberg/layouts/cornerse.png"

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "iceberg/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "iceberg/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "iceberg/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "iceberg/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "iceberg/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "iceberg/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "iceberg/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "iceberg/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "iceberg/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "iceberg/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "iceberg/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "iceberg/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "iceberg/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "iceberg/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "iceberg/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "iceberg/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "iceberg/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "iceberg/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
