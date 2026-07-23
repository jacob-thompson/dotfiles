-- helper function for hotkey mapping
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
    silent = true,
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Disable Copilot by default on startup",
    command = "Copilot disable",
})

-- Keymap to toggle Copilot on and off
vim.g.copilot_active = false
vim.keymap.set("n", "<leader>cp", function()
    if vim.g.copilot_active then
        vim.cmd("Copilot disable")
        vim.g.copilot_active = false
        print("Copilot Disabled")
    else
        vim.cmd("Copilot enable")
        vim.g.copilot_active = true
        print("Copilot Enabled")
    end
end, { desc = "Toggle GitHub Copilot", noremap = true, silent = true })

return {
    "github/copilot.vim",
    name = "copilot",
}
