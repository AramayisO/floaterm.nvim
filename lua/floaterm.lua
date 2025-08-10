local M = {
    buffer = nil,
    window = nil,
}

function M.toggle_terminal()
    if M.buffer == nil then
        M.buffer = vim.api.nvim_create_buf(false, true)
    end

    if M.window == nil or not vim.api.nvim_win_is_valid(M.window) then
        opts =  {
            relative="editor",
            anchor="NW",
            width=50,
            height=50,
            row=20,
            col=20,
            style="minimal"
        }
        M.window = vim.api.nvim_open_win(M.buffer, true, opts)
    else
        vim.api.nvim_win_hide(M.window)
    end
end

function M.setup()
    vim.keymap.set({"n", "t"}, "<leader>tt", M.toggle_terminal)
end

return M
