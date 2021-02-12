call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'kana/vim-submode'
Plug 'dense-analysis/ale'
"Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kuroitu/pyceberg'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'cohama/lexima.vim'
"Plug 'kana/vim-operator-replace'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'
Plug 'simeji/winresizer'
Plug 'yuttie/comfortable-motion.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'

call plug#end()

" color scheme
colorscheme pyceberg

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" " s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
"
" " Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" unite関連
let g:unite_enable_start_insert=1

" deoplete
let g:deoplete#enable_at_startup = 1

" linter (ALE)
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1

let g:ale_linters= {
    \ 'python': ['flake8'],
    \ }

let g:ale_fixers= {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ }

" バックアップファイル、スワップファイルを作成しない
set nowritebackup
set nobackup
set noswapfile

" airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

"uniteの設定
nnoremap sb :<C-u>Unite buffer -buffer-name=file<CR>
noremap sf :Unite file_mru<CR>

" insertモードのまま右に移動。括弧補完で便利
inoremap <C-f> <C-g>U<Right>
inoremap <C-f><C-f> <C-g>U<ESC><S-a>

" nerdtree
nnoremap :tree :NERDTreeToggle

" tabの設定
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

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

