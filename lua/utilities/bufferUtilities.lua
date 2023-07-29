function insert_data_into_buffer(buffer, data)
    local lines = vim.split(data, "\n", true)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
end

function get_data_from_buffer(bufnr)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local buffer_content = table.concat(lines, "\n")
    return buffer_content
end

function close_buffer_by_name(buffer_name)
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == buffer_name or name == "" then
            if name == buffer_name then
               _G.buffer_content_variable = get_data_from_buffer(bufnr)
            end
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end
end

