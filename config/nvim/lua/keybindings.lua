-- Leader Key
H.g.mapleader = ' '
H.g.maplocalleader = ','

-- Functionality mappings
--  List open buffers
H.keymap('n', '<leader>e', [[<Cmd>Buffers<CR>]], { silent = true })
-- Search in the current working directory
H.keymap('n', '<leader>ff', [[<Cmd>Files<CR>]], { silent = true })
-- Search the whole system
-- Every file type specified by ripgrep
H.keymap('n', '<leader>fa', [[<Cmd>call fzf#run({'source': 'rg --files --hidden --follow', 'dir': '~', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})<CR>]], { silent = true })

-- Wiki Search (Find in Note Directory)
H.keymap('n', '<leader>fna', [[<Cmd>call fzf#run({'source': 'rg --files --hidden --follow', 'dir': '~/git/effective-train', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})<CR>]], { silent = true })

-- Search the search history
H.keymap('n', '<leader>fh', [[<Cmd>History/<CR>]], { silent = true })
-- Search within the buffer
H.keymap('n', '<leader>fi', [[<Cmd>Rg<CR>]], { silent = true })

-- General mappings
-- Better copy
H.keymap('n', 'Y', 'y$')

-- Better indenting
H.keymap('v', '>', '>gv')
H.keymap('v', '<', '<gv')

-- Clear highlighting
H.keymap('n', '<C-L>', '<cmd>nohl<CR><C-L>')

-- Spelling Correction
-- Correct previous spelling error
H.keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Correct capitalisation
H.keymap('i', '<C-k>', '<c-g>u<Esc>b~$a<c-g>u')

-- Remap ; to :
H.keymap('n', ';', ':')

-- Quickfix List
H.keymap('n', '<leader>c', ':cclose<CR>')

-- Terminal Escaping
H.keymap('t', '<C-g>', '<C-\\><C-n>')
