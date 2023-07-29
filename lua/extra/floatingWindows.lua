require("utilities.bufferUtilities")

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


    

function scratchPad()
    local success, err = pcall(summonScratchPad)
    if not success then
        close_buffer_by_name(vim.loop.cwd() .. "/scratchPad")
    end
end
