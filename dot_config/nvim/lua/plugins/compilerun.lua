vim.keymap.set("n", "<F6>", "<Cmd>CompileRun<CR>")
vim.keymap.set("i", "<F6>", "<Esc><Cmd>CompileRun<CR>")
vim.keymap.set("v", "<F6>", "<Esc><Cmd>CompileRun<CR>")

return {
    "jacob-thompson/vim-compilerun",
    name = "vim-compilerun"
}
