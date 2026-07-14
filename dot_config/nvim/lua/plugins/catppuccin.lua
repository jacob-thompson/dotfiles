return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false, -- Load on startup (not lazy-loaded)
        config = function()
            require("catppuccin").setup({
                flavour = "auto",
                auto_integrations = true,
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                lsp = {
                    styles = {
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
