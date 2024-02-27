local M = {}

M.dirs = {
    music = "home/Music",
    documents = "home/Documents",
    videos = "home/Videos"
}

M.music = { ".mp3", ".wav", ".flac", ".aac", ".ogg", "m4a", ".wma", ".aiff", "ape", ".mid" }

-- txt?
M.documents = { ".md", ".tex", ".doc", ".docx", ".odt", ".pages", ".ppt", ".pptx", ".odp", ".key", ".xls", ".xlsx",
    ".ods", ".numbers", ".pdf", ".html", ".xml" }

M.videos = { ".mpeg", ".mpg", ".mp4", ".mov", ".avi", ".wmv", ".fiv", ".webm", ".ogv", ".mov", ".3gp", ".m4v", ".mkv" }


function M.showcase_defaults()
    print("Default directories and file extensions:\n")
    for category, directory in pairs(M.dirs) do
        local extensions = M[category] and table.concat(M[category], ", ") or "None"
        print("Category:", category)
        print("Directory:", directory)
        print("File Extensions:", extensions)
        print()
    end
end

return M
