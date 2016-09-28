execute pathogen#infect()
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
set tw=120
set noswapfile
set hlsearch
set nobackup
set shell=/bin/bash\ -i

"set statusline=%{GitBranch()}


"polecenia przydatne w Latex'u:
"wyliczenie
map _enu i\begin{enumerate}\item\end{enumerate}2kA
"wypunktowanie
map _ite i\begin{itemize}\item\end{itemize}2kA
"cytat
map _quo i\begin{quotation}\end{quotation}2kA
"rownanie
map _eq i\begin{equation}\end{equation}2kA
"wykomentowanie linii
map _cm :s/^/%/:noh
"odkomentowanie linii
map _ucm :s/^%//
"obrazek wraz z opisem
map _fig i\begin{figure}\begin{center}\includegraphics[width=0.9\textwidth]{%}\end{center}\caption{Opis...}\label{etykieta...}\end{figure}5kf%xi
"tabela wraz z opisem
map _tab i\begin{table}\begin{center}\caption{Opis...}\label{etykieta...}\begin{tabular}{l}\hline\end{tabular}\end{center}\end{table}5ki
"dwie columny w prezentacji
map _col i\begin{columns}\begin{column}{0.5\textwidth}\end{column}\begin{column}{0.5\textwidth}\end{column}\end{columns}7ki
"slajd
map _fra i\frame{  \frametitle{}^i  \begin{itemize}\item\end{itemize}^i}5kf{a
"podział słowa zapisanego wNotacjiWielbłądziej (split camel case)
map _scc :s/\(\l\)\(\u\)/\1\\-\2/g
"podział słowa w miejsu kropek (split dot)
map _sd :s/\(\l\)\.\(\a\)/\1.\\-\2/g
"zastąpienie początkowych spacji dwoma spacjami
map _ss :s/\s*/  /
map _std ostd::cout << "" << std::endl;dd1kf"a
       
"mapuj ctags jako gh
map gh g


"languages
"setlocal spell spelllang=pl
set spellfile=/home/fox/.pl.iso8859-2.add
map _en :set spell spelllang=en
map _pl :set spell spelllang=pl

"rails
map _h2h :s/<\(\w\+\) \(.*\)>/%\1{\2}/:s/\(\w\+\)=\("[^"]\+"\)/\1: \2,/gf}hx

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
autocmd BufWritePre *.py,*.js,*.rb,*.sass,*.css,*.haml,*.tex,Rakefile,*.lua :call <SID>StripTrailingWhitespaces()

let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('/home/fox/src/rsense')

let g:neocomplcache_omni_patterns = {}
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

set lazyredraw

colo olek
map <c-t> :NERDTree<CR>
map <c-s> :call RunNearestSpec()<CR>
map <c-a> :call RunCurrentSpecFile()<CR>
