local function keymaps()

    -- quickly leave the terminal
    vim.keymap.set({ "t", "n" }, "<c-d>", function()
        vim.api.nvim_command("q")
    end, { buffer = 0 })


    -- use <esc> to enter normal mode
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })

end

local function opts()
    vim.wo.nu = false
    vim.wo.rnu = false
end

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        if vim.bo.filetype == "quickterm" then
            vim.cmd("startinsert")

            opts()
            keymaps()
        end
    end
})
