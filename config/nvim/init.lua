------------------------------------------------------------------------
--                     Configuration for Neovim                       --
------------------------------------------------------------------------
H = require('helpers')
require('options')
require('plugins.snippets')
require('plugins.plugins')
require('plugins.completion')
require('plugins.lsp')
require('plugins.fzf')
require('plugins.treesitter')
require('plugins.vimtex')
-- require('plugins.markdowndx')
require('plugins.pandoc')
require('plugins.tree')
require('keybindings')
-- require('plugins.notational')
require('plugins.wiki')

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
-- vim.o.termguicolors = true
-- vim.g.gruvbox_italic = true

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
