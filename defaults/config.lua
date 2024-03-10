local json = require("cjson")

local M = {}

local config_file = "defaults/defaults.json"

local function provide_default_config()
    return {
        default_clean_dir = "~/Downloads",
        dirs = {
            music = "~/Music",
            documents = "~/Documents",
            videos = "~/Videos"
        },
        extensions = {
            music = { ".mp3", ".wav", ".flac", ".aac", ".ogg", ".m4a", ".wma", ".aiff", ".ape", ".mid" },
            documents = { ".md", ".tex", ".doc", ".docx", ".odt", ".pages", ".ppt", ".pptx", ".odp", ".key", ".xls", ".xlsx", ".ods", ".numbers", ".pdf", ".html", ".xml" },
            videos = { ".mpeg", ".mpg", ".mp4", ".mov", ".avi", ".wmv", ".fiv", ".webm", ".ogv", ".mov", ".3gp", ".m4v", ".mkv" }
        }
    }
end

function M.load()
    local file = io.open(config_file, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return json.decode(content)
    else
        return provide_default_config()
    end
end

function M.save(config)
    local file = io.open(config_file, "w")
    if file then
        file:write(json.encode(config))
        file:close()
    else
        print("Failed to open config file for writing.")
    end
end

function M.reset()
    local config = provide_default_config()
    M.save(config)
end

return M
