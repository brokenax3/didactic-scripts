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
    -- use 'SidOfc/mkdx'
    use 'godlygeek/tabular'

    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'

    -- LaTeX in VIM
    use {
        'lervag/vimtex',
        ft = {'pandoc', 'tex', 'bib'} 
    } 

    -- FZF with VIM
    use 'junegunn/fzf.vim'
    
    -- Indentation guides
    use 'lukas-reineke/indent-blankline.nvim'
    
    -- Neovim Tree
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = 'kyazdani42/nvim-web-devicons'
    -- }

    -- use 'alok/notational-fzf-vim'
    use 'lervag/wiki.vim'

end)
