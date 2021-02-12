call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'kana/vim-submode'

call plug#end()

let g:unite_enable_start_insert=1
"ウィンドウ周り
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s= <C-w>=
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"uniteの設定
nnoremap sb :<C-u>Unite buffer -buffer-name=file<CR>
noremap sf :Unite file_mru<CR>

syntax enable "シンタックスハイライト
set t_Co=256 "256色
set fileformats=unix,dos "改行文字
set expandtab "tabをspaceに
set smarttab "勝手にtab
set smartindent "勝手にindent
set shiftwidth=4 "勝手にindentの幅
set virtualedit=block "矩形選択で文字ないところもできる

set ignorecase "検索で大文字小文字区別しない
set smartcase "大文字入ったら区別
set incsearch "インクリメンタルサーチ
set nohlsearch "黄色の出さない
set wrapscan "最後まで検索したら戻る

set list "不可視文字をだす
set number "行番号の表示
set listchars=tab:>-,trail:~ "不可視文字の指定

set ambiwidth=double "全角文字の幅を２文字分に固定
"tagジャンプ（よくわからん）
if has('path_extra')
  set tags& tags +=.tags,tags
endif
set laststatus=2 "status lineを常に表示
set showtabline=2 "tab lineを常に表示

set clipboard=unnamed "yunkとクリップボードつなぐ

set backspace=eol,indent,start "行末，字下げ，insert開始点を遡ってbackspaceできる

set wildmenu "tab補完
set wildmode=list:full "tab補完だけどよくわからん
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll "こいつらはtab補完無視
let g:python_highlight_all = 1

filetype plugin on
autocmd BufRead,BufNewFile *.py setfiletype python
