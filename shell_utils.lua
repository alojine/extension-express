local M = {}

function M.execute_command(command)
    local file = io.popen(command)
    local output = file:read('*all')
    file:close()
    return output
end

return M
