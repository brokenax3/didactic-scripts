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
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

" Completion and Syntax Highlighting
Plug 'ycm-core/YouCompleteMe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
" Plug 'sheerun/vim-polyglot'

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
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/tokyonight.nvim'

" Tabline
" Plug 'romgrk/barbar.nvim'

" FZF Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Save Files as Sudo
Plug 'lambdalisue/suda.vim'

" Vim Minimap
"Plug 'wfxr/minimap.vim'

" Initialize plugin system
call plug#end()

luafile /home/mark/.config/nvim/lua/init.lua

"set autochdir                           " Your working directory will always be the same as your working directory
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

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
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Theme Settings {{{1
"----------------------------------------------------------------------------------
set guifont=Iosevka\ SS16:h12
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
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}
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
