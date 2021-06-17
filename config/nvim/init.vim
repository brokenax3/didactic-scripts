autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
set nocompatible
autocmd BufEnter * silent! lcd %:p:h
autocmd BufWritePost plugins.lua PackerCompile

lua require('plugins')
lua require('init')

set guifont=Liberation\ Mono:h11

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

" Mappings {{{1
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <silent> <leader>e :Buffers<CR>

" Search for files including hidden files with ripgrep
command! FZFcfg call fzf#run({'source': 'rg --files --hidden --type rc --type conf --type prog', 'dir': '~', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})
command! FZFin call fzf#run({'source': 'rg --files --hidden', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})
command! FZFall call fzf#run({'source': 'rg --files --hidden --follow', 'dir': '~', 'sink': 'e', 'window': { 'width': 0.9, 'height': 0.6 }})

nnoremap <silent> <leader>fc :FZFcfg<CR>
nnoremap <silent> <leader>fi :FZFin<CR>
nnoremap <silent> <leader>fa :FZFall<CR>

" Quickfix List
" Searching the notes directory with <args> and ripgrep
command! -nargs=1 Ngrep grep "<args>" -g "*.md" ~/git/effective-train
nnoremap <leader>nn :Ngrep 
" Making a vertical buffer on the right
command! Vlist botright vertical copen | vertical resize 40
" Quickfix buffer on whatever that was searched
nnoremap <leader>nv :Vlist<CR>
" Prints the TODO list with ripgrep
nnoremap <leader>nt :Ngrep TODO<CR> :Vlist<CR>
nnoremap <leader>c :cclose<CR>

" Spelling Correction
" Correct previous spelling error
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Correct capitalisation
inoremap <C-k> <c-g>u<Esc>b~$a<c-g>u
nnoremap ; :

" FZF
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

" VIMTEX
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
    \ ]}

" Suda VIM
let g:suda#prompt = 'Magic Words: '
let g:suda_smart_edit = 1

" Vim-Pandoc-Markdown
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
