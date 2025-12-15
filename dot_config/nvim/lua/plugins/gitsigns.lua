vim.keymap.set('n', ']g', '<Cmd>Gitsigns next_hunk<CR>', { desc = "Next Git hunk" })
vim.keymap.set('n', '[g', '<Cmd>Gitsigns prev_hunk<CR>', { desc = "Previous Git hunk" })

return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd("normal ]c")
                else
                    gs.next_hunk()
                end
            end, { desc = "Next Hunk" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd("normal [c")
                else
                    gs.prev_hunk()
                end
            end, { desc = "Prev Hunk" })

            -- Actions
            map({ "n" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
            map({ "n" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

            map({ "v" }, "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "Stage Hunk" })

            map({ "v" }, "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "Reset Hunk" })

            map({ "n" }, "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
            map({ "n" }, "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
            map({ "n" }, "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
            map({ "n" }, "<leader>hi", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })

            map({ "n" }, "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "Blame Line" })

            map({ "n" }, "<leader>hd", gs.diffthis, { desc = "Diff This" })
            map({ "n" }, "<leader>hD", function()
                gs.diffthis("~")
            end, { desc = "Diff This ~" })

            map({ "n" }, "<leader>hQ", function() gs.setqflist("all") end, { desc = "Set QF List" })
            map({ "n" }, "<leader>hq", function() gs.setqflist("buffer") end, { desc = "Set QF List (Buffer)" })

            -- Toggles
            map({ "n" }, "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
            map({ "n" }, "<leader>tw", gs.toggle_word_diff, { desc = "Toggle Word Diff" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
        end,
    },
}
