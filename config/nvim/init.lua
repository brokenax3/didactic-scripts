------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
H = require('helpers')
require('options')
require('keybindings')
require('plugins.plugins')
require('plugins.completion')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.vimtex')
require('plugins.pandoc')
require('plugins.snippets')
-- require('plugins.todo')

vim.api.nvim_command([[autocmd BufEnter * silent! lcd %:p:h]])
vim.api.nvim_command([[autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"]])

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- Neovim Theme
vim.o.termguicolors = true
-- vim.g.gruvbox_flat_style = "dark"
vim.cmd[[set background=dark]]
vim.cmd[[colorscheme gruvbox8]]

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = {'', ''},
        component_separators = {'|', '|'},
        icons_enabled = false
    },
}

-- Suda VIM
vim.g['suda#prompt'] = 'Magic Words: '
vim.g.suda_smart_edit = true
