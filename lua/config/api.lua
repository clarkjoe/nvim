vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        pcall(function()
            require("lazy").load({ plugins = { "nvim-tree" } })
            require("nvim-tree.api").tree.open()
        end)
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.agf",
    command = "set fileformat=dos",
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("TerminalLineNumbers", { clear = true }),
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end,
})

