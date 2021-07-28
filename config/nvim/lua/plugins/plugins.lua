return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Lualine
    use 'hoob3rt/lualine.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- We recommend updating the parsers on update

    -- Themes
    use 'lifepillar/vim-gruvbox8'

    -- Quality of life stuff
    --
    -- Language Server Protocol
    use 'neovim/nvim-lspconfig'
    -- Completion and Snippet itegration
    use 'hrsh7th/nvim-compe'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    -- Surrounds
    use 'tpope/vim-surround'
    -- Repeat
    use 'tpope/vim-repeat'
    -- Comments
    use 'tpope/vim-commentary'

    -- Open files at the last edited position
    use 'farmergreg/vim-lastplace'
    -- Automatic alignments
    use 'junegunn/vim-easy-align'
    -- Repeated motions
    use 'easymotion/vim-easymotion'
    -- Convenient neovim start page
    use 'mhinz/vim-startify'
    -- Edit files which require sudo
    use 'lambdalisue/suda.vim'

    -- Markdown in VIM
    use {
        'vim-pandoc/vim-pandoc',
        ft = {'pandoc', 'tex', 'bib'} 
    }
    use {
        'vim-pandoc/vim-pandoc-syntax',
        ft = {'pandoc', 'tex', 'bib'} 
    }

    -- LaTeX in VIM
    use {
        'lervag/vimtex',
        ft = {'pandoc', 'tex', 'bib'} 
    } 

    --FZF VIM
    use 'junegunn/fzf.vim'
end)
