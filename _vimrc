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
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-startify'

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

" タブ関連
function! GuiTabLabel()
  " タブで表示する文字列の初期化をします
  let l:label = ''

  " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
  let l:bufnrlist = tabpagebuflist(v:lnum)

  " 表示文字列にバッファ名を追加します
  " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  " 表示文字列を返します
  return l:label
endfunction

" guitablabel に上の関数を設定します
" その表示の前に %N というところでタブ番号を表示させています
set guitablabel=%N:\ %{GuiTabLabel()}
nnoremap t :tabnew<CR>
for n in range(1, 9)
    exe 'nnoremap ' . n . 't :<C-u>tabnext ' . n . '<CR>'
endfor

" NERD Tree
nmap <F9> :NERDTreeToggle<CR>

" vim-startify
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = ['~/.vimrc', '~/localrepos/blog/vac_20131215.md']


" キーバインド
" 挿入モード時、クリップボードから貼り付け
nmap P <ESC>"*pa


" バックアップファイルを作成しない
:set nobackup
