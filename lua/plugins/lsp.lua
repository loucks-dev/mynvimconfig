return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- capabilities for nvim-cmp
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if cmp_ok then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end

            -- function run when LSP attaches to a buffer
            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>fd", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end

            -- list of servers and optional server-specific settings
            local servers = {
                pyright = {},
                ts_ls = {},
                clangd = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } }
                        }
                    }
                }
            }

            for name, cfg in pairs(servers) do
                cfg.capabilities = capabilities
                cfg.on_attach = on_attach
                lspconfig[name].setup(cfg)
            end
        end,
    },
}

