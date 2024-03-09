local shell_utils = require("shell_utils")
local defaults = require("defaults.defaults")

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

function M.create_extension(extension, category)
    if defaults.contains_extension(extension) then
        print("Extension: " .. extension .. " is already listed in current categories")
        print("-defaults (to get more information)")
        os.exit()
    elseif not defaults.contains_category(category) then
        print("Extension: " .. extension .. " cannot be added becouse category: " .. category .. " does not exist")
        print("-create-cat [category_name] [directory_path] (create a direcory)")
        os.exit()
    end
    defaults.add_extension(category, extension)
    defaults.save_defaults()
end

function M.create_category(category, directory)
    if defaults.contains_category(category) then
        print("Category with name " .. category .. " already exists")
        print("-defaults (to get more information)")
        os.exit()
    elseif defaults.get_directory(directory) then
        print("Directory " .. directory .. " already exists in current categories")
        print("-defaults (to get more information)")
        os.exit()
    end
    defaults.add_category(category, directory)
    defaults.save_defaults()
end

function M.move(extension, category)
    if not defaults.contains_category(category) then
        print("Category with name " .. category .. " does not exists")
        print("-defaults (to get more information)")
        os.exit()
    elseif not defaults.contains_extension(extension) then
        print("Extension: " .. extension .. " does not exists")
        print("-defaults (to get more information)")
        os.exit()
    end
    defaults.delete_extension(extension)
    defaults.add_extension(category, extension)
    defaults.save_defaults()
end

return M
