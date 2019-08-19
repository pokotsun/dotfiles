" エンコーディング
set encoding=utf-8 
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double "文字が崩れる問題を解決
set clipboard=unnamedplus "clipboard

"タブ インデント
set tabstop=4 " タブステップ
set expandtab " タブ入力を複数の空白入力に置き換える
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
"filetype indent on

" leader setting
let mapleader = ","

" 文字列検索
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソル
set number " 行番号表示

" コマンド補完
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" map部分
" htmlのとじタグ保管
"imap <C-/> <C-S-\>

" #で始まる行のインデントを保持する(cope with python comment out)
inoremap # X<C-H>#

"カッコ入力時に補完
inoremap {<CR> {}<Left><CR><BS><ESC><S-o>
inoremap [<CR> []<Left><CR><BS><ESC><S-o>
inoremap (<CR> ()<Left><CR><BS><ESC><S-o>

" C++のときに初めてファイルを呼んだらテンプレートを読見込ませるようにする
autocmd BufNewFile,BufRead *.cpp if getfsize(@%) <= 0 | 0read ~/.vim/templates/template.cpp | endif

" スクリプトを編集しながら実行できるようにする
autocmd BufNewFile,BufRead *.cpp nnoremap <C-e> :!g++ -std=c++14 % && ./a.out
autocmd BufNewFile,BufRead *.rb call SetRubyOptions() 
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %
autocmd BufNewFile,BufRead *.scala nnoremap <C-e> :!scala %
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!stack runghc %
autocmd BufNewFile,BufRead *.rs nnoremap <C-e> :!rustc % -o a.out && ./a.out
autocmd Filetype go call SetGoOptions()

" 各拡張子ごとの設定用関数
function SetRubyOptions()
    nnoremap <C-e> :!ruby %
endfunction

function SetGoOptions()
    nnoremap <C-e> :GoRun
    nnoremap <C-d> :GoDef<CR>
endfunction

" その他
set showmatch " 括弧の対応表示
set noswapfile " swapfileを作らない
" escをCtr-jに対応させる
noremap <C-j> <esc>
noremap! <C-j> <esc>
"imap <C-j> <esc> 

" normal modeのときだけ;を:に対応させる
nnoremap ; :


"キーボード・ショートカット
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

" indent
noremap > >>
noremap < << 

" setting of unite.vim 
noremap <Leader>fl :Unite -buffer-name=file file<CR> "list all files
noremap <Leader>fr :Unite file_mru<CR> " list files which used recently 

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') " ウィンドウを分割して開く
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC> q
" unite.vimの設定終了

" NERDTreeのショートカット
nnoremap <Leader>t :NERDTree<CR>
"
" Markdown編集
" foldingを止める
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_math = 1

" TableModeの設定
let g:table_mode_corner = '|'

" brower preview
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'google-chrome'

" Emmet Vim のEmmet変換キーの変更
let g:user_emmet_leader_key = '<C-L>'

" vim-goの設定
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_arguments = 1 
let g:go_highlight_variable_declarations = 1

" set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libstdc++ --pedantic-errors'
 
" SuperTab like snippets behavior.
imap  <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"---------------------------------------------------------
" Start Dein Settings.
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein.vim

call dein#begin(expand('~/.vim/dein.vim'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" neosnippet
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
" end of neosnippet config

call dein#add('Shougo/neomru.vim')
call dein#add('vim-scripts/closetag.vim')
call dein#add('easymotion/vim-easymotion')

" カッコを閉じるやつ(コメントアウトで謎のスペースが空いてしまうエラーがあるため断念)
"call dein#add('Townk/vim-autoclose')
call dein#add('cohama/lexima')
" Treeを表示
call dein#add('scrooloose/nerdtree')  
"
call dein#add('ConradIrwin/vim-bracketed-paste')
" Syntax HighLight系
" scalaのsyntaxhighlight
call dein#add('derekwyatt/vim-scala')
call dein#add('elzr/vim-json')
" nginx conf syntax
call dein#add('chr4/nginx.vim')
"" ディレクトリ処理
call dein#add('Shougo/unite.vim')
"
" LaTEX
call dein#add('vim-latex/vim-latex')
"
" MarkDown編集用
" Table挿入
call dein#add('dhruvasagar/vim-table-mode')

" TableFormat
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')

" emmet用
call dein#add('mattn/emmet-vim')

" typescript highlight
call dein#add('leafgarland/typescript-vim')

" go-vim
call dein#add('fatih/vim-go')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('cespare/vim-toml')

" vim-c++
call dein#add('justmao945/vim-clang')

" vim-elixir
call dein#add('elixir-lang/vim-elixir')
"" Vim-pluginTest
""call dein#add('pokotsun/helloworld-vim')
""call dein#add('bonjin6770/hello-beautiful-world.vim')

call dein#end()
"---------------------------------------------------------

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

"autocmd ColorScheme * highlight MatchParen gui=bold guibg=NONE guifg=blue


