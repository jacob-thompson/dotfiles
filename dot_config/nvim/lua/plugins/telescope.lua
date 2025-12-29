return {
    'nvim-telescope/telescope.nvim',
    tag = "v0.2.0",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files,
            { desc = 'Telescope find files' })

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = 'Telescope grep string' })

        vim.keymap.set('n', '<C-p>', builtin.git_files,
            { desc = 'Telescope find git files' })

        vim.keymap.set('n', 'gd', function()
            builtin.lsp_definitions()
        end, {
                noremap = true,
                silent = true,
                desc = 'Telescope LSP go to definition'
            })

        vim.keymap.set('n', 'gr', function()
            builtin.lsp_references()
        end, {
                noremap = true,
                silent = true,
                desc = 'Telescope LSP find references'
            })
    end
}
