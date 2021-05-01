"             
"                  ://.             
"   :dhyyyyyyhhsymdyyyyyyymo`  
"  `M+hNNNNNNNooh/yNNNNNNm/mo  
"  `NhoNMMMMMh+sh++NMMMMMm/do  
"   `modMMMMMoss+yNMMMMm+-oN+  
"   /N+dMMMMMo/yMMMMMm+-:dN/   
" -mds/dMMMMMNNMMMMm+-/ydyymy  
" /y/s/dMMMMMMMMMm+-/yhhhyo:m  
" -mh/-dMMMMMMMm+-/yhhhy+:omy  
"   /N+dMMMMMm+-/yhhhy+:omy.   
"    modMMMm+-/yhhhy+:omy.     
"    mo/yy+--+hhhy+:omy.       
"    oms++omh/:o+:omy.         
"     `////-/mh/omy.           
"             ://.
"
"
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
set nocompatible
autocmd BufEnter * silent! lcd %:p:h

"----------------------------------------------------------------------------------
" VIM Plug {{{1
"----------------------------------------------------------------------------------
" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" General Vim Plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

" Completion and Syntax Highlighting
Plug 'ycm-core/YouCompleteMe'
Plug 'sheerun/vim-polyglot'

" Vim Markdown Plugins
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Vim LaTeX
Plug 'lervag/vimtex'

" Vim Snippets Plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Theme Plugins
Plug 'itchyny/lightline.vim'
Plug 'arzg/vim-substrata'
Plug 'cocopon/iceberg.vim'
"Plug 'jsit/toast.vim'
"Plug 'lifepillar/vim-solarized8'

" FZF Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Save Files as Sudo
Plug 'lambdalisue/suda.vim'

" Vim Minimap
"Plug 'wfxr/minimap.vim'

" Initialize plugin system
call plug#end()

"----------------------------------------------------------------------------------
" VIM Settings {{{1
"----------------------------------------------------------------------------------
"
" Leader Key
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

" Several QOS Settings
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
" set spell
" set spellfile=~/.config/nvim/spell/en.utf-8.add\
set spelllang=en_au
" let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell'
set wildmenu                            " Better command-line completion
set showcmd                             " Show partial commands in the last line of the screen
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set title                               " Let GUI window title to be the file name

" Middle Selection Copy for nvim-qt
set mouse=a                             " Enable your mouse
vmap <LeftRelease> "*ygv

" Support 256 colors
set t_Co=256

" Always display the status line, even if only one window is displayed
set laststatus=2

" Indentation Settings
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

set ignorecase
set smartcase

" Relative Line Numbers
set number relativenumber

" Completion and Timeout
set updatetime=300                      " Faster completion
set notimeout ttimeout ttimeoutlen=200  " Quickly time out on keycodes, but never time out on mappings

" Copy paste between vim and everything else
set clipboard+=unnamedplus               

" VIM Marker Folding
set foldmethod=marker

"set autochdir                           " Your working directory will always be the same as your working directory
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
" cmap w!! w !sudo tee %

" GUI Font
" set guifont=Input\ Mono\ Compressed:h13
" set guifont=scientifica:h13

" Set Undo and Swap file
set undodir=~/.local/share/nvim/undo//
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undofile
set backup

" Make :grep use ripgrep
if executable('rg')
    set grepprg=rg\ --pretty\ --vimgrep
endif

" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" Don't count acronyms / abbreviations as spelling errors
 " (all upper-case letters, at least three characters)
 " Also will not count acronym with 's' at the end a spelling error
 " Also will not count numbers that are part of this
 " Recognizes the following as correct:
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

"----------------------------------------------------------------------------------
" Mappings {{{1
"----------------------------------------------------------------------------------
"
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" Buffer fzf
nnoremap <silent> <leader>e :Buffers<CR>
" Search for files including hidden files with ripgrep
command! FZFall call fzf#run({'source': 'rg --files --hidden --vimgrep', 'dir': '~', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})
nnoremap <silent> <leader>q :FZFall<CR>

" Pandoc Convert to pdf
nnoremap <silent> <leader>pp :Pandoc! pdf --toc --toc-depth=4 -V geometry:margin=1in -f markdown-raw_tex<CR>
nnoremap <silent> <leader>pd :Pandoc! docx -V geometry:margin=1in -f markdown-raw_tex<CR>

" Spelling Correction
"
" Correct previous spelling error
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Correct capitalisation
inoremap <C-k> <c-g>u<Esc>b~$a<c-g>u

" QOL Shortcuts
"
" Notes Index Shortcut
command! Nindex :e ~/git/effective-train/index.md
nnoremap <silent> <leader>ne :Nindex<CR>
nnoremap ; :

" Quickfix List
"
" Searching the notes directory with <args> and ripgrep
command! -nargs=1 Ngrep grep "<args>" -g "*.md" ~/git/effective-train
nnoremap <leader>nn :Ngrep 
" Making a vertical buffer on the right
command! Vlist botright vertical copen | vertical resize 40
" Quickfix buffer on whatever that was searched
nnoremap <leader>v :Vlist<CR>
" Prints the TODO list with ripgrep
nnoremap <leader>nt :Ngrep TODO<CR> :Vlist<CR>
nnoremap <leader>c :cclose<CR>

" Stop using Arrow Keys
"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Theme Settings {{{1
"----------------------------------------------------------------------------------
"
set guifont=Iosevka\ SS02:h12

if has('termguicolors')
  set termguicolors
endif

colorscheme substrata
" let g:solarized_extra_hi_groups = 1
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

"----------------------------------------------------------------------------------
" FZF Settings {{{1
"----------------------------------------------------------------------------------
"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"----------------------------------------------------------------------------------
" Vim-Pandoc-Markdown {{{1
"----------------------------------------------------------------------------------
let g:pandoc#syntax#conceal#blacklist = ['atx']
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#style#emphases = 1
let g:pandoc#folding#level = 1
let g:pandoc#folding#fastfolds = 1
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#folding#use_foldtext = 0
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ["c", "asm", "bash=sh", "python", "java", "kotlin"]
let g:pandoc#hypertext#create_if_no_alternates_exists = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
" let g:pandoc#spell#enabled = 0
" Let Markdown Preview Work with Pandoc Files
let g:mkdp_command_for_global = 1
"----------------------------------------------------------------------------------
" Vim-Tex {{{1
"----------------------------------------------------------------------------------
let g:vimtex_view_method = 'zathura'
let g:vimtex_fold_enabled = 1

"----------------------------------------------------------------------------------
" FastFold {{{1
let g:fastfold_savehook = 0

"----------------------------------------------------------------------------------
" Markdown-Preview {{{1
"----------------------------------------------------------------------------------
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_auto_close = 0
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '/home/mark/.local/share/nvim/plugged/markdown-preview.nvim/markdown.css'
let g:mkdp_highlight_css = '/home/mark/.local/share/nvim/plugged/markdown-preview.nvim/highlight.js/src/styles/solarized-light.css'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
nnoremap <F8> :MarkdownPreview<CR>


"----------------------------------------------------------------------------------
" YouCompleteMe {{{1
"----------------------------------------------------------------------------------
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_max_num_candidates = 20
let g:ycm_complete_in_comments = 1

" Completion for Pandoc and LaTeX
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

let g:ycm_filetype_blacklist = {}

" Movement Key Remaps
" Prevents Up and Down key to be used as scrolling selections
inoremap <expr> <Up> pumvisible() ? '<c-y><Up>' : '<Up>'
inoremap <expr> <Down> pumvisible() ? '<c-y><Down>' : '<Down>'

"----------------------------------------------------------------------------------
" UltiSnips {{{1
"----------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<a-w>"
let g:UltiSnipsJumpForwardTrigger="<a-w>"
let g:UltiSnipsJumpBackwardTrigger="<a-b>"

"----------------------------------------------------------------------------------
" Suda VIM {{{1
"----------------------------------------------------------------------------------
let g:suda#prompt = 'Magic Words: '
let g:suda_smart_edit = 1

"----------------------------------------------------------------------------------
" Minimap {{{1
"----------------------------------------------------------------------------------
"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"----------------------------------------------------------------------------------
" Folding {{{1
"----------------------------------------------------------------------------------
fu! CustomFoldText()
    " get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

" set custom fold text to system
set foldtext=CustomFoldText()
