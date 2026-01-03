return {
    "OXY2DEV/markview.nvim",
    name = "markview",
    lazy = false,
    config = function()
        vim.api.nvim_set_keymap(
            "n",
            "<leader>md",
            "<CMD>Markview<CR>",
            {
                desc = "Toggle Markview",
                noremap = true,
                silent = true,
            }
        )
    end,
};
