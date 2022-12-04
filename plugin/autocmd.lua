vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        if vim.bo.filetype == "quickterm" then
            vim.cmd("startinsert")

            vim.wo.nu = false
            vim.wo.rnu = false

            vim.keymap.set("t", "<c-d>", function()
                vim.api.nvim_command("q")
            end, {
                buffer = 0
            })
        end
    end
})
