local M = {}

local create_buf = function()
    return vim.api.nvim_create_buf(false, true)
end

local create_term = function(bufnr, cmd)
    local height = vim.opt.lines:get()
    local width = vim.opt.columns:get()

    local padding = 10

    local float_width = 80
    local float_height = 25

    local winh = vim.api.nvim_open_win(bufnr, false,
        {
            relative = "editor",
            col = width - float_width - padding,
            row = height - float_height - padding + 5,
            width = float_width,
            height = float_height,
            border = "rounded",
            title = "quickterm"
        })

    local catched_pwd = vim.fn.expand('%:p:h')

    vim.api.nvim_set_current_win(winh)
    vim.bo.filetype = "quickterm"

    vim.fn.termopen(cmd, {
        detach = 1,
        cwd = catched_pwd
    })
end

M.commands = {
    javascript = "node",
    typescript = "ts-node",
    lua = "lua",
    python = "python3",
    ocaml = "utop"
}

M.open = function()
    local cmd = M.commands[vim.bo.filetype]

    -- si le language n'est pas supporté
    if not cmd then
        return
    end

    local bufnr = create_buf()

    create_term(bufnr, cmd .. "\n")
end

return M
