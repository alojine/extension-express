local defaults = require("defaults")
local env_handler = require("env_handler")

local function main()
    if arg[1] == "-clean" then
        -- grab an input dir for cleaner
        env_handler.perform_clean()
    elseif arg[1] == "-defaults" then
        defaults.showcase_defaults()
    elseif arg[1] == "-move" then
        -- move extension
    elseif arg[1] == "-create-cat" then
        -- create-dir=name
    elseif arg[1] == "-create-ext" then
        -- create extension
        env_handler.add_extension(".txt", "documents")
        defaults.showcase_defaults()
    end
end

main()
