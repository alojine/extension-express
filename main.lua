local defaults = require("defaults")

local function main()
    if arg[1] == "-clean" then
        -- handle cleaning session
    elseif arg[1] == "-defaults" then
        defaults.showcase_defaults()
    elseif arg[1] == "-move" then
        -- move extension
    elseif arg[1] == "-create-dir" then
        -- create-dir=name
    elseif arg[1] == "create-ext" then
        -- create extension
    end
end

main()
