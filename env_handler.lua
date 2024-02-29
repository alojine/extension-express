local defaults = require("defaults")

local M = {}

function M.add_extension(extension, category)
    if defaults.contains_extension(extension) then
        print("Extension: " .. extension .. " is already listen in current categories")
        print("-defaults (to get more information)")
        os.exit()
    elseif not defaults.contains_category(category) then
        print("Extension: " .. extension .. " cannot be added becouse category: " .. category .. " does not exist")
        print("-create-cat [category_name] [directory_path] (create a direcory)")
        os.exit()
    end
    defaults.add_extension(extension, category)
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
