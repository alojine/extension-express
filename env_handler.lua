local shell_utils = require("shell_utils")
local defaults = require("defaults")

local M = {}

-- local target = defaults.default_clean_dir
local target = "~/Temp"
local destination = "~/Destination"

function M.perform_clean(dir)
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

function M.add_extension(extension, category)
    if defaults.contains_extension(extension) then
        print("Extension: " .. extension .. " is already listed in current categories")
        print("-defaults (to get more information)")
        os.exit()
    elseif not defaults.contains_category(category) then
        print("Extension: " .. extension .. " cannot be added becouse category: " .. category .. " does not exist")
        print("-create-cat [category_name] [directory_path] (create a direcory)")
        os.exit()
    end
    print('Reached reading')
    defaults.add_extension(category, extension)
end

function M.add_category(category, direcory)
    if defaults.contains_category(category) then
        print("Category with name " .. category .. " already exists")
        print("-defaults (to get more information)")
        os.exit()
    else
        -- check if directory does not exist in categories
    end
end

return M
