


"色関係

syntax on 
" コメントの色を変える
hi Comment ctermfg=LightBlue 
colorscheme molokai
set t_Co=256

" エンコーディング

set encoding=utf-8 
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"タブ　インデント

set tabstop=2 " タブステップ
set expandtab " タブ入力を複数の空白入力に置き換える
set expandtab " タブ入力を複数の空白入力に置き換える
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅


" 文字列検索

set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソル
set number " 行番号表示
" 表示行のみ色付け
set cursorline
hi clear CursorLine

" コマンド補完

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" その他
set showmatch " 括弧の対応表示
set noswapfile " swapfileを作らない
imap <c-j> <esc>

"---------------------------------------------------------
" Start NeoBundle Settings.
"---------------------------------------------------------
" 初回起動時のみruntimepathにNeoBundleのパスを指定する
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/vagrant/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する・・・・・・②

NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'




"----------------------------------------------------------
call neobundle#end()

" Required:
" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on
" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定

"未インストールのプラグインがある場合、インストールするかどうかを尋ねる
"NeoBundleCheck

"----------------------------------------------------------
"  End NeoBundle Settings.
"----------------------------------------------------------
