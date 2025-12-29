vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        local mlsp = require("mason-lspconfig")
        mlsp.setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp",
                "zls",
            },
        })

        local lspconfig = require("lspconfig")

        local handlers = {
            -- Default handler for servers without custom setup
            function(server_name)
                lspconfig[server_name].setup { capabilities = capabilities }
            end,

            clangd = function()
                lspconfig.clangd.setup {
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--completion-style=detailed",
                        "--header-insertion=never",
                    },
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
                }
            end,

            zls = function()
                lspconfig.zls.setup({
                    root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                    settings = {
                        zls = {
                            enable_inlay_hints = true,
                            enable_snippets = true,
                            warn_style = true,
                        },
                    },
                })
                vim.g.zig_fmt_parse_errors = 0
                vim.g.zig_fmt_autosave = 0

            end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            runtime = { version = "Lua 5.1" },
                            diagnostics = {
                                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                            }
                        }
                    }
                }
            end,
        }

        if mlsp.setup_handlers then
            mlsp.setup_handlers(handlers)
        else
            -- older mason-lspconfig: pass handlers directly to setup
            mlsp.setup({ ensure_installed = { "lua_ls", "clangd", "pylsp", "zls" }, handlers = handlers })
        end

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            -- Disable virtual text, signs, and underlines for all severities
            virtual_text = false,
            signs = false,
            underline = false,
        })
    end
}
