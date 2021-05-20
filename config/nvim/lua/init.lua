------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------

-- Neovim Theme
vim.g.tokyonight_style = 'night'
vim.cmd[[colorscheme tokyonight]]

require('lualine').setup{
    options = { 
        theme = 'tokyonight',
        icons_enabled = false
    },
    extensions = {'fzf'}
}
