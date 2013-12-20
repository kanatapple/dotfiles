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
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-startify'

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

" �^�u�֘A
function! GuiTabLabel()
  " �^�u�ŕ\�����镶����̏����������܂�
  let l:label = ''

  " �^�u�Ɋ܂܂��o�b�t�@(�E�B���h�E)�ɂ��Ă̏����Ƃ��Ă����܂��B
  let l:bufnrlist = tabpagebuflist(v:lnum)

  " �\��������Ƀo�b�t�@����ǉ����܂�
  " �p�X��S���\��������ƒ����̂Ńt�@�C�����������g���܂� �ڂ����� help fnamemodify()
  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  " �o�b�t�@�����Ȃ���� No title �Ƃ��Ă����܂��B�����ł̓}���`�o�C�g�������g��Ȃ��ق�������ł�
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  " �^�u���ɃE�B���h�E����������Ƃ��ɂ͂��̐���ǉ����܂�(�f�t�H���g�ňꉞ����̂�)
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  " ���̃^�u�y�[�W�ɕύX�̂���o�b�t�@����Ƃ��ɂ� '[+]' ��ǉ����܂�(�f�t�H���g�ňꉞ����̂�)
  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  " �\���������Ԃ��܂�
  return l:label
endfunction

" guitablabel �ɏ�̊֐���ݒ肵�܂�
" ���̕\���̑O�� %N �Ƃ����Ƃ���Ń^�u�ԍ���\�������Ă��܂�
set guitablabel=%N:\ %{GuiTabLabel()}
nnoremap t :tabnew<CR>
for n in range(1, 9)
    exe 'nnoremap ' . n . 't :<C-u>tabnext ' . n . '<CR>'
endfor

" NERD Tree
nmap <F9> :NERDTreeToggle<CR>

" vim-startify
" �f�t�H���g���ƁA�ŋߎg�����t�@�C���̐擪�͐����Ȃ̂ŁA�g�p����A���t�@�x�b�g���w��
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" �悭�g���t�@�C�����u�b�N�}�[�N�Ƃ��ēo�^���Ă���
let g:startify_bookmarks = ['~/.vimrc', '~/localrepos/blog/vac_20131215.md']


" �L�[�o�C���h
" �}�����[�h���A�N���b�v�{�[�h����\��t��
nmap P <ESC>"*pa


" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
:set nobackup
