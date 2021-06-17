return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Lualine
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Themes
    use 'folke/tokyonight.nvim'

    -- Quality of life stuff
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    use 'farmergreg/vim-lastplace'
    use 'junegunn/vim-easy-align'
    use 'easymotion/vim-easymotion'
    use 'mhinz/vim-startify'
    use 'lambdalisue/suda.vim'

    -- Markdown in VIM
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    
    -- LaTeX in VIM
    use 'lervag/vimtex'

    -- FZF VIM
    use 'junegunn/fzf.vim'
end)
