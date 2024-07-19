return {
    {
        "github/copilot.vim"
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    {
        "pocco81/auto-save.nvim"
    },
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({
                comment_empty = false,
                marker_padding = true,
            })
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "romgrk/barbar.nvim",
        config = function()
            require("barbar").setup({
                show_tab_indicators = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_buffer_icons = false,
                tab_size = 18,
                mappings = true,
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                indicator_icon = "",
                separator_style = "thin",
                offsets = {
                    { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
                },
            })
        end
    },
    {
        "themaxmarchuk/tailwindcss-colors.nvim",
        module = "tailwindcss-colors",
        config = function()
            require("tailwindcss-colors").setup()
        end
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })

            require("cmp").setup({
                formatting = { format = require("tailwindcss-colorizer-cmp").formatter }
            })
        end
    }
}
