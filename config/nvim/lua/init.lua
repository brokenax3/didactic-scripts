------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
require('options')
require('plugins.completion')
require('plugins.lsp')

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Neovim Theme
vim.cmd[[set background=dark]]
vim.cmd[[colorscheme gruvbox8]]
vim.cmd[[let g:gruvbox_filetype_hi_groups = 1]]

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        icons_enabled = false
    },
}

-- Treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    }
}

