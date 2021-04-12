---------------------
--  Volume Widget  --
---------------------
local wibox = require("wibox")

local text = wibox.widget{
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox,
}

volume_indicator = {
    text,
    fg = '#95c4ce',
    widget = wibox.container.background
}

function update_volume(widget)
    local fd = io.popen("pamixer --get-volume-human")
    local status = fd:read("*all")
    fd:close()

    widget.markup = "Volume: ".. status
end

update_volume(text)

mytimer = timer({ timeout = 5 })
mytimer:connect_signal("timeout", function () update_volume(text) end)
mytimer:start()
