"=====================================================================================
"	heliumu's vimrc
"	Can't use on Windows.
"=====================================================================================

"=====================================================================================
if has('vim_starting')
	"vi 互換モード対策
	if &compatible
	  set nocompatible	"なんか効果ないんですけど…
	  					"inoremap <C-[> <ESC>が悪さをしていたみたい
	endif

	"NeoBundle Required
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" ファイルタイプ識別を一旦無効化
filetype off
filetype plugin indent off


" Encode
" COMMENT:S-JISは帰って、どうぞ。
"=====================================================================================
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8


" エディタ関係
"=====================================================================================
" 表示関係
set number                      	" set line number
set title                       	" Display file name
set nowrap							" 画面端で折り返さない
set cursorline                  	" 現在位置を横線で表示
set cursorcolumn					" 現在位置を縦線で表示
"set ruler	

" indent関係
set tabstop=4                   	" Tab size
set noexpandtab                 	" Tab is tab
set shiftwidth=4                	" Auto indent tab size
set autoindent                  	" On auto indent
set smartindent             

" system・file関係
set clipboard=unnamed,autoselect	" clipboard for 'OS clipboard'
set noswapfile                  	" No make swap file(~file)
set autoread						" ファイル更新時に自動読み込み


" cui関係
"=====================================================================================
"if has('cui_running')
	set t_Co=256

	" 背景・色
	set background=dark
	colorscheme molokai
"endif


" gui関係
"=====================================================================================
if has('gui_running')
	" font関係
	set guifont=ubuntu\ mono\ 11    " font
	set linespace=0

	" 起動時の大きさ
	set columns=120					"window height
	set lines=35    				"window wheight
	
	" 背景・色
	set background=dark
	"colorscheme solarized
	colorscheme molokai
endif


" keyMap
"=====================================================================================
inoremap <c-c> <Esc>                 " C-c is ESC
inoremap <c-j> <ESC>

" 参考:http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>			" 水平分割
nnoremap sv :<C-u>vs<CR>			" 垂直分割
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


" plugin
"=====================================================================================
call neobundle#begin(expand('~/.vim/bundle/')) 	"equired:
NeoBundleFetch 'Shougo/neobundle.vim' 			"neobundle自体をneobundleで管理

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
	let g:neocomplete#enable_at_startup = 1
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

NeoBundle 'itchyny/lightline.vim'	            "ステータスライン全体拡張
	set laststatus=2
	let g:lightline = {
   	\ 'colorscheme': 'wombat'
	\ }
	nmap <Space>m <Plug>(quickhl-manual-this)
	xmap <Space>m <Plug>(quickhl-manual-this)
	nmap <Space>M <Plug>(quickhl-manual-reset)
	xmap <Space>M <Plug>(quickhl-manual-reset)

NeoBundle 'scrooloose/nerdtree'					"ファイルツリー表示系男子
NeoBundle 'tomtom/tcomment_vim'					"comment on/offを<c-_>でできる
NeoBundle 'vim-jp/cpp-vim',{
	\ 'autoload' : {'filetypes' : 'cpp'}
	\ }
	"http://rhysd.hatenablog.com/entry/2013/12/10/233201
	augroup cpp-path
		autocmd!
		autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
	augroup END

"rsense
NeoBundle 'supermomonga/neocomplete-rsense.vim'
"rsense v0.3 -> http://cx4a.org/pub/rsense/rsense-0.3.zip
let g:rsenseHome = '/usr/src/rsense-0.3'
let g:rsenseUseOmniFunc = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
  let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

  let g:rsenseUseOmniFunc = 1

"Arduino
"便利やから一緒にinoもいんすこするといいやで
"$sudo easy_install inoでOK
"シリアルモニタ使うならaptでpicocomいれてや	
NeoBundle 'sudar/vim-arduino-syntax'

" end sequence
"=====================================================================================
call neobundle#end()

syntax on			"色分け
filetype on			"ファイルタイプの識別
filetype indent on
filetype plugin on

NeoBundleCheck
