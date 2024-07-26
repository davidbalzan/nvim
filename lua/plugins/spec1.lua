return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "javascript", "html", "zig" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local mason = require("mason")

            local mason_tool_installer = require("mason-tool-installer")

            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier", -- prettier formatter
                    "eslint_d", -- js linter
                },
            })
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            opts.formatters_by_ft["javascript"] = { "prettier" }
            opts.formatters_by_ft["typescript"] = { "prettier" }
            opts.formatters_by_ft["html"] = { "prettier" }
            opts.formatters_by_ft["css"] = { "prettier" }
            opts.formatters_by_ft["json"] = { "prettier" }
            opts.formatters_by_ft["yaml"] = { "prettier" }
            -- tsx formatters
            opts.formatters_by_ft["typescriptreact"] = { "prettier" }
            opts.formatters_by_ft["javascriptreact"] = { "prettier" }
            opts.formatters_by_ft["tsx"] = { "prettier" }
            opts.formatters_by_ft["jsx"] = { "prettier" }

            opts.formatters = opts.formatters or {}
            opts.formatters.prettier = {
                condition = function(_, ctx)
                    return vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx)
                end,
            }
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- check whether to execute tailwindcss lsp
                -- only when tailwindcss is loaded
                if client.name == 'tailwindcss' then
                    require('tailwindcss-colors').buf_attach(bufnr)
                end
            end)

            -- to learn how to use mason.nvim
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'tsserver',
                    'eslint',
                    'zls',
                    'lua_ls',
                    'html',
                    'ansiblels',
                    'bashls',
                    'cssls',
                    'tailwindcss',
                    'jdtls',
                    'dockerls',
                    'jsonls',
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end
                },
            })

            local cmp = require('cmp')
            lsp_zero.preset('recommended')

            cmp.setup({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'mason' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'prettier' },
                },
                preselect = cmp.PreselectMode.Item,
            })
            lsp_zero.setup()
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { "folke/todo-comments.nvim",         opts = {} },
}
