local M = {}

M.default_clean_dir = "~/Downloads"

M.dirs = {
    music = "~/Music",
    documents = "~/Documents",
    videos = "~/Videos"
}

M.extensions = {
    music = { ".mp3", ".wav", ".flac", ".aac", ".ogg", ".m4a", ".wma", ".aiff", ".ape", ".mid" },
    documents = { ".md", ".tex", ".doc", ".docx", ".odt", ".pages", ".ppt", ".pptx", ".odp", ".key", ".xls", ".xlsx", ".ods", ".numbers", ".pdf", ".html", ".xml" },
    videos = { ".mpeg", ".mpg", ".mp4", ".mov", ".avi", ".wmv", ".fiv", ".webm", ".ogv", ".mov", ".3gp", ".m4v", ".mkv" }
}

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
    local does_contain = false
    for category, extensions in pairs(M.extensions) do
        for _, ext in ipairs(extensions) do
            if ext == target_ext then
                does_contain = true
                break
            end
        end
        if does_contain then break end
    end

    return does_contain
end

function M.contains_category(target_cat)
    local does_contain = false
    for category, extensions in pairs(M.extensions) do
        if target_cat == category then
            does_contain = true
        end

        if does_contain then break end
    end
    return does_contain
end

function M.contains_directory(target_dir)
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

return M
