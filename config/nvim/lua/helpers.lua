local M = {}

M.cmd = vim.cmd
M.opt = vim.opt
M.fn = vim.fn
M.g = vim.g
M.execute = vim.api.nvim_command

function M.is_buffer_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function M.has_width_gt(cols)
    return vim.fn.winwidth(0) / 2 > cols
end

function M.keymap(mode, nk, ok, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, nk, ok, options)
end

return M
