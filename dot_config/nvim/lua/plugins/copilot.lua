-- helper function for hotkey mapping
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.copilot_no_tab_map = true
map("i", "<S-Tab>", "copilot#Accept('<CR>')", { silent = true, expr = true })

return { "github/copilot.vim", name = "copilot" }
