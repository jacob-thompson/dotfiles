-- F2 to open netrw
vim.keymap.set("n", "<F2>", vim.cmd.Ex)

-- F3 to save
vim.keymap.set("n", "<F3>", vim.cmd.w)

-- F4 to quit
vim.keymap.set("n", "<F4>", vim.cmd.q)

-- F5 to show error/warning diagnostics in a floating window
vim.keymap.set("n", "<F5>", ":lua vim.diagnostic.open_float()<CR>")
