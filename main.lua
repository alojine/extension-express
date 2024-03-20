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
        print("Usage: lua main.lua [option] [arguments]")
        print("Options:")
        print("  -clean [directory]             Clean up files in the specified directory based on their extensions")
        print("  -defaults                      Show default settings")
        print("  -move [extension] [category]   Move files with a specific extension to a different category")
        print("  -create-cat [category] [directory]  Create a new category with the specified directory")
        print("  -create-ext [extension] [category]  Create a new extension under the specified category")
        print("  -remove-cat [category]         Remove the specified category")
        print("  -remove-ext [extension]        Remove the specified extension from its category")
        print("  -reset                         Reset configuration settings to default")
        print("  -help                          Show this help message")
    else
        print("Invalid option. Use '-help' for usage instructions.")
    end
end

main()
