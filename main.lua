local defaults = require("defaults.defaults")
local env_handler = require("env_handler")
local config = require("defaults.config")

local function main()
    if arg[1] == "-clean" then
        env_handler.perform_clean(arg[2])
    elseif arg[1] == "-defaults" then
        defaults.showcase_defaults()
    elseif arg[1] == "-move" then
        env_handler.move(".txt", "music")
    elseif arg[1] == "-create-cat" then
        env_handler.create_category(arg[2], arg[3])
    elseif arg[1] == "-create-ext" then
        env_handler.create_extension(arg[2], arg[3])
    elseif arg[1] == "-remove-cat" then
        env_handler.remove_category(arg[2])
    elseif arg[1] == "-remove-ext" then
        env_handler.remove_extension(arg[2])
    elseif arg[1] == "-reset" then
        config.reset()
    elseif arg[1] == "-help" then
    end
end

main()
