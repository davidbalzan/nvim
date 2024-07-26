require("custom.remap")

-- Set tab-related options
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4      -- Number of spaces a tab counts for
vim.opt.softtabstop = 4  -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent

vim.wo.number = true

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
        vim.api.nvim_echo({ { "Formatting buffer.. ", 'ErrorMsg' } }, true, {})
    end,
})

