-- Leader Key
H.g.mapleader = ' '
H.g.maplocalleader = ','

-- Functionality mappings
--  List open buffers
H.keymap('n', '<leader>e', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { silent = true })
-- Search in the current working directory
H.keymap('n', '<leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { silent = true })
-- Search the whole system
-- Config files
H.keymap('n', '<leader>fc', [[<Cmd>lua require('telescope.builtin').find_files({ cwd = '/home/mark' , follow = true, find_command = { 'rg', '--files', '--hidden', '--type', 'sh', '--type', 'config', '--type', 'lua'}})<CR>]], { silent = true })
-- Every file type specified by ripgrep
H.keymap('n', '<leader>fa', [[<Cmd>lua require('telescope.builtin').find_files({ cwd = '/home/mark' , follow = true, hidden = true, find_command = { 'rg', '--files', '--type', 'all' }})<CR>]], { silent = true })
-- Notes and LaTeX 
H.keymap('n', '<leader>fn', [[<Cmd>lua require('telescope.builtin').find_files({ cwd = '/home/mark/git' , follow = true, hidden = true, find_command = { 'rg', '--files', '--type', 'markdown', '--type', 'tex' }})<CR>]], { silent = true })
-- Live Grep
H.keymap('n', '<leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { silent = true })
-- Search the search history
H.keymap('n', '<leader>fh', [[<Cmd>lua require('telescope.builtin').search_history()<CR>]], { silent = true })
-- Search within the buffer
H.keymap('n', '<leader>fb', [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { silent = true })

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
