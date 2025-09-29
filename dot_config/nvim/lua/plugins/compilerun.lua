vim.keymap.set("n", "<F5>", "<Cmd>CompileRun<CR>")
vim.keymap.set("i", "<F5>", "<Esc><Cmd>CompileRun<CR>")
vim.keymap.set("v", "<F5>", "<Esc><Cmd>CompileRun<CR>")

return { "jacob-thompson/vim-compilerun", name = "vim-compilerun" }
