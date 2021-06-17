------------------------------------------------------------------------
--                         Vim Configuration                          --
------------------------------------------------------------------------
-- Better command-line completion
vim.o.wildmenu = true
-- Show partial commands in the last line of the screen
vim.o.showcmd = true
-- The encoding displayed
vim.o.encoding = 'utf-8'
-- Makes popup menu smaller
vim.o.pumheight = 10
-- The encoding written to file
vim.o.fileencoding = 'utf-8'
-- Show the cursor position all the time
vim.o.ruler = true
-- More space for displaying messages
vim.o.cmdheight = 2
-- treat dash separated words as a word text object"
vim.o.iskeyword = vim.o.iskeyword .. ',-'
-- Horizontal splits will automatically be below
vim.o.splitbelow = true
-- Vertical splits will automatically be to the right
vim.o.splitright = true
-- Let GUI window title to be the file name
vim.o.title = true
-- Maximum fold numbers
vim.o.foldnestmax = 0
-- Support 256 colors
vim.go.t_Co = '256'
-- Always display the status line, even if only one window is displayed
vim.o.laststatus = 2
------------------------------------------------------------------------
--                             QOS Stuff                              --
------------------------------------------------------------------------
-- Enables syntax highlighing
-- vim.o.syntax = 'ON'                           
-- Required to keep multiple buffers open multiple buffers
vim.o.hidden = true                          
vim.o.spell = false
-- vim.o.spellfile = '/home/mark/.config/nvim/spell/en.utf-8.add'
-- vim.o.spelllang = 'en_au'
-- set custom fold text to system
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
------------------------------------------------------------------------
--                               Mouse                                --
------------------------------------------------------------------------
-- Enable your mouse
vim.o.mouse = 'a'
vim.api.nvim_set_keymap('v', '<LeftRelease>', '"*ygv', {silent = true})
------------------------------------------------------------------------
--                            Indentation                             --
------------------------------------------------------------------------
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
-- Makes tabbing smarter will realize you have 2 vs 4
vim.o.smarttab = true
-- Makes indenting smart
vim.o.smartindent = true
-- Good auto indent
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
------------------------------------------------------------------------
--                            Line Number                             --
------------------------------------------------------------------------
-- Relative Line Numbers
vim.o.number = true
vim.wo.number = true
vim.o.relativenumber = true
vim.wo.relativenumber = true
------------------------------------------------------------------------
--                              Timeout                               --
------------------------------------------------------------------------
-- Faster completion
vim.o.updatetime = 300                      
-- Quickly time out on keycodes, but never time out on mappings
vim.o.timeout = false
vim.o.ttimeoutlen = 200
-- Copy paste between vim and everything else
-- vim.o.clipboard = 'unnamedplus'
-- Set Undo and Swap file
vim.o.undodir = '/home/mark/.local/share/nvim/undo//'
vim.o.backupdir = '/home/mark/.local/share/nvim/backup//'
vim.o.directory = '/home/mark/.local/share/nvim/swap//'
vim.o.undofile = true
vim.o.backup = true
