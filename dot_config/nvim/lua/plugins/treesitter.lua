return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",

    config = function()
        -- ensure parsers are installed
        require("nvim-treesitter").install({
            "lua",
            "javascript",
            "typescript",
            "python",
            "c",
            "cpp",
        })

        -- enable treesitter highlighting
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
