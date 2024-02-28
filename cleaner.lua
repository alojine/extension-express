local shell_utils = require("shell_utils")
local defaults = require("defaults")

local M = {}

local target = "~/Temp"

function M.clean(dir)
    if dir ~= nil then
        target = dir
    end

    local items = shell_utils.execute_command("ls " .. target)
    for filename in items:gmatch("[^\r\n]+") do
        local _, _, ext = filename:find("^.+(%..+)$")
        if ext then
            local category = defaults.extract_category(ext)
            local dir = defaults.get_directory(category)
        end
    end
end

return M
