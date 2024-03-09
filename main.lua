local defaults = require("defaults.defaults")
local env_handler = require("env_handler")

local function main()
    if arg[1] == "-clean" then
        -- grab an input dir for cleaner
        env_handler.perform_clean()
    elseif arg[1] == "-defaults" then
        defaults.showcase_defaults()
    elseif arg[1] == "-move" then
        -- move extension(.txt) category(documents)
    elseif arg[1] == "-create-cat" then
        -- create-cat category(documents) directory(Documents)
        env_handler.create_category(arg[2], arg[3])
    elseif arg[1] == "-create-ext" then
        -- create-ext extension(.txt) category(documments)
        env_handler.create_extension(arg[2], arg[3])
    end
end

main()
