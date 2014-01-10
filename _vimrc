"Vi�݊�OFF
set nocompatible
filetype off

" vim�N�����̂�runtimepath��neobundle.vim��ǉ�
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vim�̏����� 
call neobundle#rc(expand('~/.vim/bundle'))

" �ǂݍ��ރv���O�C�����L��
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

"�t�@�C���`���ʃv���O�C���̃��[�h��L����
filetype plugin on
filetype indent on

" �C���X�g�[���̃`�F�b�N
NeoBundleCheck


"�v���O�C���ݒ�.
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
" �N�����ɗL��
let g:neocomplcache_enable_at_startup = 1
" 1�Ԗڂ̌��������I��
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1 " desable auto completion
" �⊮��₪�\������Ă���ꍇ�͊m��B�����łȂ��ꍇ�͉��s
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" �⊮���L�����Z��
inoremap <expr><C-e>  neocomplcache#close_popup()
"�I���j�⊮�̎蓮�Ăяo��.
inoremap <expr><C-Space> neocomplcache#start_manual_complete()

" NERD Tree
nmap <F9> :NERDTreeToggle<CR>

" vim-startify
" �f�t�H���g���ƁA�ŋߎg�����t�@�C���̐擪�͐����Ȃ̂ŁA�g�p����A���t�@�x�b�g���w��
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" �悭�g���t�@�C�����u�b�N�}�[�N�Ƃ��ēo�^���Ă���
let g:startify_bookmarks = ['~/.vimrc', '~/localrepos/blog/vac_20131215.md']

" NERD Commenter
" �R�����g������ɑ}������X�y�[�X�̐�
let NERDSpaceDelims = 1
" �L�[�}�b�v�̕ύX�B<Leader>=\+c�ŃR�����g���Ɖ������s���B
" �R�����g����Ă���΁A�R�����g���O���A�R�����g����ĂȂ���΃R�����g������B
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" syntastic "{{{
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript'],
            \ 'passive_filetypes': [] }
" }}}"

"" over.vim {{{

" over.vim�̋N��
nnoremap <silent> ,m :OverCommandLine<CR>

" �J�[�\�����̒P����n�C���C�g�t���Œu��
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" �R�s�[������������n�C���C�g�t���Œu��
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "

" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
:set nobackup
