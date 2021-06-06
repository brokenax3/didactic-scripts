local fzf_run = vim.fn["fzf#run"]
local fzf_wrap = vim.fn["fzf#wrap"]

local search = fzf_wrap('test', {
    'source' = 'rg --files --hidden --vimgrep', 
    'dir' = '/home/mark', 
    'window' = 
    { 
        'width' = 0.9, 
        'height' = 0.6
    }
})
seach['sink*'] = 'e'

vim.api.nvim_set_keymap('n', '<Leader>q', fzf_run(search), { noremap = true, silent = true })
