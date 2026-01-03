vim.keymap.set("n", "<F6>", "<Cmd>QuickRun<CR>")
vim.keymap.set("i", "<F6>", "<Esc><Cmd>QuickRun<CR>")
vim.keymap.set("v", "<F6>", "<Esc><Cmd>QuickRun<CR>")

return {
    "jacob-thompson/vim-quickrun",
    name = "vim-quickrun"
}
