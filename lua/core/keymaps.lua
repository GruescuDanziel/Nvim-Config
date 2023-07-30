require("extra.floatingWindows")

function setKey(mode,keyBind,action)
    vim.keymap.set(mode,keyBind,action)
end

setKey("n", "<C-t>", ":tabnew<CR>") -- Just open an empty tab
setKey("n", "<C-e>", ":CHADopen<CR>") -- Open file tree
setKey("n", "<leader>s", scratchPad) -- Open ScratchPad

setKey("n", "<leader>c", ":Copilot panel")

setKey("n", "<C-s>", ":w<CR>") --- Save the document
setKey("n", "<C-q>", ":q!<CR>") --- Quit the document

setKey("n", "<C-a>", "gT") --- Move to the tab on the left
setKey("n", "<C-d>", "gt") --- Move to the tab on the right
