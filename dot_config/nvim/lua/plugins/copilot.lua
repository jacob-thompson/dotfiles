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

return {
    "github/copilot.vim",
    name = "copilot",
}
