" encoding 
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " char-code on saving file 
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double "文字が崩れる問題を解決

" Tab Indent
set tabstop=4 " tab step 
set expandtab " タブ入力を複数の空白入力に置き換える
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

set splitright "画面を縦分割する際に右に開く
set clipboard=unnamedplus "clipboard

" leader setting
let mapleader = ","

" syntax
syntax on
set number


" others 
set showmatch " 括弧の対応表示
set noswapfile " swapfileを作らない


" key mapping
" esc to ctr-j 
noremap <C-j> <esc>
noremap! <C-j> <esc>
" when normal mode, ; to :
nnoremap ; :

noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

" indent
noremap > >>
noremap < << 

" open new file from current file opened path
nnoremap <Leader>fn :call OpenFileFromCurrentPath(1)<CR>
nnoremap <Leader>fc :call OpenFileFromCurrentPath(0)<CR>

" Executor for each kind programs    
autocmd BufNewFile,BufRead *.cpp call SetCPPOptions()
autocmd BufNewFile,BufRead *.rb call SetRubyOptions()     
autocmd BufNewFile,BufRead *.py call SetPythonOptions()    
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %    
autocmd BufNewFile,BufRead *.scala nnoremap <C-e> :!scala %    
autocmd BufNewFile,BufRead *.hs call SetHaskellOptions()
autocmd BufNewFile,BufRead *.rs call SetRustOptions()
autocmd Filetype go call SetGoOptions()    
    
"" FUNCTIONS ----------------------------------
function SetCPPOptions()
    nnoremap <C-e> :!g++ -std=c++14 % && ./a.out
endfunction

function SetPythonOptions()
    nnoremap <C-e> :!python %
endfunction

function SetRubyOptions()    
    nnoremap <C-e> :!ruby %    
endfunction    

function SetHaskellOptions()
    nnoremap <C-e> :!stack runghc %
endfunction
    
function SetGoOptions()    
    nnoremap <C-e> :GoRun    
    nnoremap <C-d> :GoDef<CR>    
endfunction

function SetRustOptions()
    nnoremap <C-e> :!rustc % -o a.out && ./a.out
endfunction

function OpenFileFromCurrentPath(withNewWindow)
    let path = expand("%:p:h")."/"
    if a:withNewWindow
        execute "Sex ".path
    else
        execute "ex ".path
    endif
endfunction


" ----------------- dein.vim ---------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"色関係

syntax on 
if !has('gui_running')
  augroup seiya
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermfg=grey
    autocmd VimEnter,ColorScheme * highlight CursorLineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
  augroup END
endif

" コメントの色を変える
let g:rehash256=1
let g:molokai_original = 1
colorscheme molokai
hi Comment ctermfg=darkcyan
hi Visual ctermfg=magenta

" カッコのハイライト時の色を変える
hi MatchParen cterm=bold ctermfg=cyan ctermbg=blue
set t_Co=256

" 表示行のみ色付け
set cursorline
hi clear CursorLine
