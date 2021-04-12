-------------------------
--  Brightness Widget  --
-------------------------
local wibox = require("wibox")

local text = wibox.widget{
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

brightness_indicator = {
    text,
    fg = '#e2a478',
    widget = wibox.container.background
}

function update_brightness()
    local fd = io.popen("brightnessctl -m | awk -F',' '{print $4}'")
    local status = fd:read("*all")
    fd:close()

    text.markup = "Brightness: " .. status 
end

update_brightness()
