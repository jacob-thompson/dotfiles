-- F2 to open netrw
vim.keymap.set("n", "<F2>", vim.cmd.Ex)

-- F3 to show error/warning diagnostics in a floating window
vim.keymap.set("n", "<F3>", ":lua vim.diagnostic.open_float()<CR>")

-- F4 to request code action
vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action)

-- remove this useless keymap that I always hit accidentally for some reason
vim.keymap.set("i", "<C-u>", "<Nop>")
