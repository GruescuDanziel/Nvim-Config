require("extra.floatingWindows")

vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-e>", ":Lex<CR>:vertical resize 40<CR>")
vim.keymap.set("n", "<leader>s", scratchPad)

vim.keymap.set("n", "<C-s>", ":w<CR>") --- Save the document
vim.keymap.set("n", "<C-q>", ":q!<CR>") --- Quit the document
