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

    vim.api.nvim_set_current_win(winh)

    vim.fn.termopen(cmd .. "\n", {
        detach = 1
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
    local bufnr = create_buf()
    local cmd = M.commands[vim.bo.filetype]

    create_term(bufnr, cmd)
end

M.open()

return M
