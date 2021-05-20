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
    local sink = io.popen("pamixer --list-sinks | grep 'bluez' | awk '{print $1}'")

    if sink:read("*all") == "" then
        fd = io.popen("pamixer --get-volume-human")
    else
        item = sink:read("*all")
        -- print("pamixer --sink " .. item .. " --get-volume-human")
        -- fd = io.popen("pamixer --sink " .. item .. " --get-volume-human")
    end

    -- local status = fd:read("*all")
    sink:close()
    -- fd:close()

    -- widget.markup = "Volume: ".. status
    widget.markup = "pamixer --sink " .. item .. " --get-volume-human"
end

update_volume(text)

mytimer = timer({ timeout = 5 })
mytimer:connect_signal("timeout", function () update_volume(text) end)
mytimer:start()
