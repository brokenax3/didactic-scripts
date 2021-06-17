local wibox = require("wibox")
local gears = require("gears")
local dpi = require('beautiful').xresources.apply_dpi

local menubox = wibox.widget {
    {
        markup = 'Test some text',
        resize = true,
        widget = wibox.widget.textbox,
    },
    layout = wibox.layout.fixed.horizontal
}

local centered_menubox = wibox {
    visible = true,
    ontop = true,
    height = 100,
    width = 200,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 3)
    end,
}

centered_menubox:setup {
    valigh = 'center',
    layout = wibox.container.place,
    menubox,
}

return centered_menubox
