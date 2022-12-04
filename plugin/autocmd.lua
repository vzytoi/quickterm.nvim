vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        if vim.bo.filetype == "quickterm" then
            vim.cmd("startinsert")

            vim.wo.nu = false
            vim.wo.rnu = false
        end
    end
})
