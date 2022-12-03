vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.cmd("startinsert")
    end
})
