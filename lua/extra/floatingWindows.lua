local function insert_data_into_buffer(buffer, data)
    local lines = vim.split(data, "\n", true)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
end


function summonScratchPad()
    width = 50
    height = 20

    buf =vim.api.nvim_create_buf(true,false)
    if _G.buffer_content_variable then
        insert_data_into_buffer(buf,_G.buffer_content_variable)
    end
    vim.api.nvim_buf_set_name(buf, "scratchPad")

    ui = vim.api.nvim_list_uis()[0]
    local opts = {}
        opts['relative']= 'editor'
        opts['width']= width
        opts['height']= height
        opts['col']= (vim.o.columns/2) - (width/2)
        opts['row']= (vim.o.lines/2) - (height/2)
        opts['anchor']= 'NW'
        opts['border'] = 'shadow'
        opts['title'] = 'scratchPad'

    win = vim.api.nvim_open_win(buf, 1, opts)
end


local function get_data_from_buffer(bufnr)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local buffer_content = table.concat(lines, "\n")
    return buffer_content
end
     

local function close_buffer_by_name(buffer_name)
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

function scratchPad()
    local success, err = pcall(summonScratchPad)
    if not success then
        close_buffer_by_name(vim.loop.cwd() .. "/scratchPad")
    end
end
