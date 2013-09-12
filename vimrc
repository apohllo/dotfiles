call pathogen#infect()
syntax on
filetype plugin indent on
"let g:slime_target = "tmux"

set softtabstop=2
set tabstop=8
set magic
filetype on
filetype plugin on
set modeline
set expandtab
set cursorline
set laststatus=2
set shiftwidth=2
set autoindent
set nocompatible
set tw=80
set noswapfile

"set statusline=%{GitBranch()}


"polecenia przydatne w Latex'u:
"wyliczenie
map _enu i\begin{enumerate}
"wypunktowanie
map _ite i\begin{itemize}
"cytat
map _quo i\begin{quotation}
"wykomentowanie linii
map _cm :s/^/%
"odkomentowanie linii
map _ucm :s/^%//
"obrazek wraz z opisem
map _fig i\begin{figure}
"tabela wraz z opisem
map _tab i\begin{table}
"dwie columny w prezentacji
map _col i\begin{columns}
"slajd
map _fra i\frame{
"podział słowa zapisanego wNotacjiWielbłądziej (split camel case)
map _scc :s/\(\l\)\(\u\)/\1\\-\2/g
"podział słowa w miejsu kropek (split dot)
map _sd :s/\(\l\)\.\(\a\)/\1.\\-\2/g
"zastąpienie początkowych spacji dwoma spacjami
map _ss :s/\s*/  /
map _std ostd::cout << "" << std::endl;
       
"mapuj ctags jako gh
map gh g


"languages
"setlocal spell spelllang=pl
set spellfile=/home/fox/.pl.iso8859-2.add
map _en :set spell spelllang=en
map _pl :set spell spelllang=pl


"local help
"helptags ~/.vim/doc

"map to fuzzy finder text mate stylez
nnoremap <c-f> :CtrlP<CR>

"biale spacje
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py,*.js,*.rb,*.sass,*.css,*.haml :call <SID>StripTrailingWhitespaces()
colo olek
map <c-t> :NERDTree<CR>