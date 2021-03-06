"Vi互換OFF
set nocompatible
filetype off

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化 
call neobundle#rc(expand('~/.vim/bundle'))

" 読み込むプラグインを記載
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-startify'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'akira-hamada/friendly-grep.vim'
NeoBundle 'alpaca-tc/beautify.vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     {
      \       'name' : 'Beautify',
      \       'complete' : 'customlist,beautify#complete_options'
      \     }
      \ ]
      \ }}
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'myhere/vim-nodejs-complete'

"ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on

" インストールのチェック
NeoBundleCheck


"プラグイン設定.
"fuf
nnoremap f` :FufBookmark<CR>
nnoremap fa :FufAddBookmark<CR>
nnoremap fb :FufBuffer<CR>
nnoremap fd :FufDir<CR>
nnoremap fe :FufDirWithCurrentBufferDir<CR>
nnoremap ff :FufFile<CR>
nnoremap fh :FufHelpWithCursorWord<CR>
nnoremap fj :FufJumpList<CR>
nnoremap fl :FufLine<CR>
nnoremap fm :FufMruFile<CR>
nnoremap fr :FufRenewCache<CR>
nnoremap ft :FufTagWithCursorWord<CR>
nnoremap fw :FufFileWithCurrentBufferDir<CR>
let g:fuf_infoFile = '~/.vim/fuf/info'
let g:fuf_tag_cache_dir = '~/.vim/fuf/cache/tag'
let g:fuf_taggedfile_cache_dir = '~/.vim/fuf/cache/taggedfile'
let g:fuf_help_cache_dir = '~/.vim/fuf/cache/help'
let g:fuf_mrufile_maxItem = 100

" neocomplcache
" 起動時に有効
let g:neocomplcache_enable_at_startup = 1
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1 " desable auto completion
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()
"オムニ補完の手動呼び出し.
inoremap <expr><C-Space> neocomplcache#start_manual_complete()

" NERD Tree
nmap <F9> :NERDTreeToggle<CR>

" vim-startify
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = ['~/.vimrc', '~/localrepos/blog/vac_20131215.md']

" NERD Commenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
" コメントされていれば、コメントを外し、コメントされてなければコメント化する。
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" syntastic "{{{
" let g:syntastic_typescript_checkers = ['tsc']
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['javascript', 'css', 'typescript'],
            \ 'passive_filetypes': [] }
" }}}"

"" over.vim {{{

" over.vimの起動
nnoremap <silent> ,m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
let g:vimshell_user_prompt = 'getcwd()'

" vimshell map
nnoremap <silent> vs :sp<cr><c-w><c-w>:VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

" コメント自動挿入をやめる
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" Friendly-Grep
nnoremap <C-g> <ESC>:FriendlyGrep<CR>

let g:friendlygrep_recursively = 1
" 毎回「再帰検索する？」と聞かれるのがウザい場合はこれを設定すると聞いてこなくなります。 
" 1 : 常に再帰検索 
" 0 : 常に非再帰検索
" (デフォルトはnull、毎回聞いてきます)

let g:friendlygrep_display_result_in = 'quickfix'
" 検索結果の開き方を指定出来ます。
" 'tab' : 新規タブに表示
" 'split' : 現在のウィンドウを横分割して上に表示 (デフォルト)
" 'vsplit' : 現在のウィンドウを縦分割して左に表示
" 'quickfix' : 現在のウィンドウにquickfixリストと共に表示

set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set noundofile                   " アンドゥファイルを作らない

autocmd BufRead,BufNewFile *.ts set filetype=typescript
