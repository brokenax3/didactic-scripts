------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
require('options')

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Neovim Theme
vim.g.tokyonight_style = 'night'
vim.o.termguicolors = true
vim.cmd([[colorscheme tokyonight]])

require('lualine').setup{
    options = {
        theme = 'tokyonight',
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
