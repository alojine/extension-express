local defaults = require("defaults")
local cleaner = require("cleaner")

local function main()
    if arg[1] == "-clean" then
        -- grab an input dir for cleaner
        cleaner.clean()
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
