local config = require("defaults.config")

local M = {}

local environment = config.load()
M.default_clean_dir = environment.default_clean_dir
M.dirs = environment.dirs
M.extensions = environment.extensions

function M.save_defaults()
    local data = {
        default_clean_dir = M.default_clean_dir,
        dirs = M.dirs,
        extensions = M.extensions
    }
    config.save(data)
end

function M.showcase_defaults()
    print("Default directories and file extensions:\n")
    for category, directory in pairs(M.dirs) do
        local extensions = M.extensions[category] and table.concat(M.extensions[category], ", ") or "None"
        print("Category:", category)
        print("Directory:", directory)
        print("File Extensions:", extensions)
        print()
    end
end

function M.extract_category(target_ext)
    local cat = nil
    for category, extensions in pairs(M.extensions) do
        for _, ext in ipairs(extensions) do
            if ext == target_ext then
                cat = category
                break
            end
        end
        if cat then break end
    end

    return cat
end

function M.get_directory(target_cat)
    local dir = nil
    for category, directory in pairs(M.dirs) do
        if target_cat == category then
            dir = directory
        end
    end

    return dir
end

function M.contains_extension(target_ext)
    for category, extensions in pairs(M.extensions) do
        for _, ext in ipairs(extensions) do
            if ext == target_ext then
                return true
            end
        end
    end

    return false
end

function M.add_extension(target_cat, target_ext)
    for category, extensions in pairs(M.extensions) do
        if target_cat == category then
            table.insert(extensions, target_ext)
            return true
        end
    end
    return false
end

function M.delete_extension(target_ext)
    for category, extensions in pairs(M.extensions) do
        for i, ext in ipairs(extensions) do
            if ext == target_ext then
                table.remove(M.extensions[category], i)
                return true
            end
        end
    end
    return false
end

function M.contains_category(target_cat)
    for category, extensions in pairs(M.extensions) do
        if target_cat == category then
            return true
        end
    end
    return false
end

function M.add_category(target_cat, target_dir)
    M.dirs[target_cat] = target_dir
    M.extensions[target_cat] = {}
end

function M.delete_category(target_cat)
    if M.dirs[target_cat] then
        M.dirs[target_cat] = nil
        M.extensions[target_cat] = nil
        return true
    else
        return false
    end
end

return M
