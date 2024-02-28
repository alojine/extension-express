local shell_utils = require("shell_utils")
local defaults = require("defaults")

local M = {}

-- local target = defaults.default_clean_dir
local target = "~/Temp"
local destination = "~/Destination"

function M.clean(dir)
    if dir ~= nil then
        -- upgrade directory search
        target = dir
    end

    local items = shell_utils.execute_command("ls " .. target)
    for filename in items:gmatch("[^\r\n]+") do
        local _, _, ext = filename:find("^.+(%..+)$")
        if ext then
            local category = defaults.extract_category(ext)
            local dir = defaults.get_directory(category)
            shell_utils.execute_command("mv " .. target .. "/" .. filename .. " " .. dir)
        end
    end
end

return M
