local shell_utils = require("shell_utils")
local defaults = require("defaults")

local M = {}

function M.clean(dir)
    local target = "~/Temp"
    if dir ~= nil then
        target = dir
    end

    local items = shell_utils.execute_command("ls " .. target)
    for filename in items:gmatch("[^\r\n]+") do
        local _, _, ext = filename:find("^.+(%..+)$")
        if ext then
            local category = defaults.match_category(ext)
            print(category)
        end
    end
end

return M
