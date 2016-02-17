if !1 | finish | endif

" flags {{{
let s:is_windows=has('win16') || has('win32') || has('win64')
let s:is_cygwin=has('win32unix')
" }}}


" variables {{{
let s:share_dir='~/Dropbox/sync'
let s:vimfiles='~/.vim'
" for portable use
"let s:vimfiles=$VIM . '/.vim'
"
" }}}


" initialization {{{
" language
language C
set langmenu=none

if has('vim_starting')
  let &runtimepath.=',' . s:vimfiles . '/bundle/neobundle.vim/'
endif

" neobundle {{{
call neobundle#begin(expand(s:vimfiles . '/bundle/'))

if neobundle#load_cache()
  NeoBundle 'matchit.zip'
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleLazy 'Shougo/neosnippet.vim', {
        \ 'on_ft': 'snippet',
        \ 'on_i': 1,
        \ }
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build': {
        \     'windows': 'tools\\update-dll-mingw',
        \     'cygwin': 'make -f make_cygwin.mak',
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \ }}
  NeoBundleLazy 'Shougo/unite.vim', {
        \ 'on_cmd': [
        \     {'name': 'Unite',
        \      'complete': 'customlist,unite#complete_source'},
        \     'UniteWithCursorWord', 'UniteWithInput'],
        \ }
  NeoBundle 'Shougo/junkfile.vim', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundle 'Shougo/neomru.vim', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundle 'Shougo/unite-help', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundle 'Shougo/unite-outline', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundle 'osyo-manga/unite-quickfix', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundle 'ujihisa/unite-colorscheme', {
        \ 'depends': 'Shougo/unite.vim',
        \ }
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'disabled': !has('lua'),
        \ 'on_i': 1,
        \ }
  NeoBundleLazy 'Shougo/neocomplcache.vim', {
        \ 'disabled': has('lua'),
        \ 'on_i': 1,
        \ }
  NeoBundleLazy 'Shougo/vimfiler', {
        \ 'on_cmd': [
        \     {'name': 'VimFiler',
        \      'complete': 'customlist,vimfiler#complete'},
        \      'VimFilerExplorer', 'VimFilerTab'],
        \ }
  NeoBundleLazy 'Shougo/vimshell.vim', {
        \ 'on_cmd': ['VimShell', 'VimShellExecute', 'VimShellInteractive',
        \              'VimShellPop'],
        \ }
  NeoBundleLazy 'blyoa/vim-promela-syntax', {
        \ 'on_ft': 'promela'
        \ }
  NeoBundleLazy 'chrisbra/vim-diff-enhanced', {
        \ 'on_cmd': ['EnhancedDiff', 'PatienceDiff'],
        \ }
  NeoBundle 'cohama/vim-hier'
  NeoBundleLazy 'ctrlpvim/ctrlp.vim', {
        \ 'on_cmd': ['CtrlP', 'CtrlPMixed', 'CtrlPBuffer', 'CtrlPMRUFiles']
        \ }
  NeoBundleLazy 'mattn/ctrlp-register', {
        \ 'depends': 'ctrlpvim/ctrlp.vim',
        \ 'on_cmd': ['CtrlPRegister'],
        \ }
  NeoBundleLazy 'mattn/sonictemplate-vim', {
        \ 'on_ft': 'all',
        \ }
  NeoBundle 'deris/vim-visualinc'
  NeoBundle 'flazz/vim-colorschemes'
  NeoBundleLazy 'glidenote/memolist.vim', {
        \ 'on_cmd': ['MemoNew', 'MemoList', 'MemoGrep'],
        \ }
  NeoBundleLazy 'hail2u/vim-css3-syntax', {
        \ 'on_ft': ['css', 'sass', 'scss', 'less'],
        \ }
  NeoBundleLazy 'haya14busa/incsearch.vim', {
        \ 'on_map': '<Plug>',
        \ }
  NeoBundleLazy 'haya14busa/vim-asterisk', {
        \ 'on_map': '<Plug>(asterisk-',
        \ }
  NeoBundleLazy 'hynek/vim-python-pep8-indent', {
        \ 'on_ft': ['python', 'python3', 'djangohtml'],
        \ 'on_i': 1,
        \ }
  NeoBundleLazy 'itchyny/calendar.vim', {
        \ 'on_cmd': ['Calendar'],
        \ }
  NeoBundleLazy 'junegunn/vim-easy-align', {
        \ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
        \ 'on_map': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
        \ }
  NeoBundleLazy 'justmao945/vim-clang', {
        \ 'on_ft': ['c', 'cpp']
        \ }
  NeoBundleLazy 'KabbAmine/zeavim.vim', {
        \ 'on_map': ['<Leader>z', '<Leader>Z'],
        \ }
  NeoBundle 'kana/vim-niceblock'
  NeoBundle 'kana/vim-altr'
  NeoBundleLazy 'kana/vim-operator-user', {
        \ 'on_func': 'operator#user#define',
        \ }
  NeoBundleLazy 'kana/vim-operator-replace', {
        \ 'depends': 'kana/vim-operator-user',
        \ 'on_map': '<Plug>',
        \ }
  NeoBundleLazy 'rhysd/vim-operator-surround', {
        \ 'depends': 'kana/vim-operator-user',
        \ 'on_map': '<Plug>',
        \ }
  NeoBundleLazy 'kana/vim-textobj-user'
  NeoBundle 'kana/vim-textobj-indent', {
        \ 'depends': 'kana/vim-textobj-user',
        \ }
  NeoBundleLazy 'thinca/vim-textobj-between', {
        \ 'depends': 'kana/vim-textobj-user',
        \ 'on_map': '<Plug>',
        \ }
  NeoBundle 'kana/vim-submode'
  NeoBundleLazy 'lilydjwg/colorizer', {
        \ 'on_ft': ['html', 'djangohtml',
        \               'css', 'sass', 'scss', 'less'],
        \ }
  NeoBundleLazy 'mattn/emmet-vim', {
        \ 'on_ft': ['html', 'djangohtml',
        \               'css', 'sass', 'scss', 'less'],
        \ }
  NeoBundleLazy 'osyo-manga/vim-reanimate', {
        \ 'on_cmd': ['ReanimateLoad', 'ReanimateLoadLatest',
        \              'ReanimateSave', 'ReanimateSwitch'],
        \ }
  NeoBundleLazy 'othree/html5.vim', {
        \ 'on_ft': ['html', 'djangohtml'],
        \ }
  NeoBundleLazy 'pangloss/vim-javascript', {
        \ 'on_ft': ['html', 'djangohtml', 'javascript'],
        \ }
  NeoBundleLazy 't9md/vim-quickhl', {
        \ 'on_map': '<Plug>',
        \ }
  NeoBundleLazy 'thinca/vim-qfreplace', {
        \ 'on_ft': ['unite', 'quickfix'],
        \ }
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundleLazy 'tyru/capture.vim', {
        \ 'on_cmd': [
        \     {'name': 'Capture',
        \      'complete': 'command'}],
        \ }
  NeoBundleLazy 'tyru/caw.vim', {
        \ 'on_map': '<Plug>',
        \ }
  NeoBundleLazy 'tyru/open-browser.vim', {
        \ 'on_map': '<Plug>(openbrowser-',
        \ }
  NeoBundleLazy 'kannokanno/previm', {
        \ 'depends': 'tyru/open-browser.vim',
        \ 'on_ft': ['markdown', 'mkd', 'rst'],
        \ }
  NeoBundleLazy 'vim-jp/vim-go-extra', {
        \ 'on_ft': ['go'],
        \ }
  NeoBundleSaveCache
endif

call neobundle#end()
" }}}

filetype plugin indent on

NeoBundleCheck
" }}}


" basic settings {{{
" encoding
let &termencoding=&encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" IME
if has('multi_byte_ime')
  set iminsert=0
  set imsearch=-1
endif

" appearance
set hlsearch
set number
set ruler
set title
set t_Co=256
set display=lastline
set showcmd
set list
set listchars=extends:>,precedes:<,tab:\|_,trail:_

" statusline
set laststatus=2
let &statusline="%{expand('%:p:.')}\ %w%r\%m"
      \ . "\ %=%y%{'['.(&fenc!=''?&fenc:&enc).(&bomb?'(BOM)':'').','.&ff.']'}"
      \ . "%{printf('(%d)%5d/%d',winnr(), line('.'), line('$'))}"

" completion
set pumheight=20

" colorscheme
syntax enable
set synmaxcol=500
if !s:is_windows || has('gui_running')
  colorscheme Tomorrow-Night
endif

" window
set splitbelow
set splitright
set previewheight=10

" indent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set shiftround
set autoindent
set smartindent

" enable incsearch
set incsearch

" enable modeline
set modeline

" increment/decrement
set nrformats=hex,alpha

" make
let &makeprg=executable('mingw32-make') ? 'mingw32-make' : 'make'

" tags
set tags=./.tags;,./tags;
" misc
set hidden
set backspace=indent,eol,start
set nowildmenu
set wildmode=list:longest,full
set history=10000

" keymap
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" }}}


" platform settings {{{
" Cygwin
if s:is_cygwin
  let &t_ti .= "\e[1 q"
  let &t_SI .= "\e[5 q"
  let &t_EI .= "\e[1 q"
  let &t_te .= "\e[0 q"
  set backspace=indent,eol,start
endif
" }}}


" plugin settings {{{
" 2html.vim {{{
let g:html_font = 'Inconsolata'',''Migu 1M'
" }}}

" calendar.vim {{{
if neobundle#tap('calendar.vim')
  let g:calendar_first_day = 'sunday'
  let g:calendar_time_zone = 9
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
  call neobundle#untap()
endif "}}}

" caw.vim {{{
if neobundle#tap('caw.vim')
  " keymap
  nmap <Leader>c <Plug>(caw:I:toggle)
  vmap <Leader>c <Plug>(caw:I:toggle)

  call neobundle#untap()
endif " }}}

" ctrlp.vim {{{
if neobundle#tap('ctrlp.vim')
  " enable extensions
  let g:ctrlp_extensions=['mixed']

  " disable switch buffer
  let g:ctrlp_switch_buffer = ''

  " keymap
  let g:ctrlp_map=''
  nnoremap [ctrlp] <Nop>
  nmap  <C-p> [ctrlp]

  nnoremap <silent> [ctrlp]<C-p> :<C-u>CtrlP<CR>
  nnoremap <silent> [ctrlp]m :<C-u>CtrlPBookmarkDir<CR>
  nnoremap <silent> [ctrlp]M :<C-u>CtrlPBookmarkDirAdd!<CR>
  nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
  " ctrlp-register
  if neobundle#is_installed('ctrlp-register')
    nnoremap <silent> [ctrlp]r :<C-u>CtrlPRegister<CR>
  endif

  call neobundle#untap()
endif "}}}

" emmet-vim {{{
if neobundle#tap('emmet-vim')
  let g:user_emmet_settings={
        \ 'variables': {
        \     'lang': 'ja',
        \ }}

  call neobundle#untap()
endif " }}}

" ft-tex-plugin {{{
let g:tex_flavor = 'latex'
"}}}

" incsearch.vim {{{
if neobundle#tap('incsearch.vim')
  " keymap
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  call neobundle#untap()
endif "}}}

" memolist.vim {{{
if neobundle#tap('memolist.vim')
  " memodir
  if isdirectory(expand(s:share_dir))
    let g:memolist_path=expand(s:share_dir . '/memolist')
  else
    let g:memolist_path=expand(s:vimfiles . '/memolist')
  endif

  " suffix type
  let g:memolist_memo_suffix='mkd'

  " settings to use unite
  if neobundle#is_installed('unite.vim')
    let g:memolist_unite=1
    let g:memolist_unite_option='-auto-preview'
  endif

  call neobundle#untap()
endif " }}}

" neocomplcache.vim {{{
if neobundle#tap('neocomplcache.vim')
  let g:neocomplcache_enable_at_startup=1

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif

  " golang
  let g:neocomplcache_omni_patterns.go = '[^.[:digit:] *\t]\.\w*'

  call neobundle#untap()
endif " }}}

" neocomplete.vim {{{
if neobundle#tap('neocomplete.vim')
  let g:neocomplete#enable_at_startup=1

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  " c
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  " cpp
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  " golang
  let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'

  call neobundle#untap()
endif " }}}

" neosnippet.vim {{{
if neobundle#tap('neosnippet.vim')
  " addtional snippet directory
  let g:neosnippet#snippets_directory=s:vimfiles . '/snippets'

  " keymap
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \  : pumvisible() ? "\<C-n>": "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \  : "\<TAB>"

  call neobundle#untap()
endif " }}}

" openbrowser.vim {{{
if neobundle#tap('open-browser.vim')
  " disable netrw's gx mapping
  let g:netw_nogx=1

  " keymap
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  call neobundle#untap()
endif " }}}

" quickhl {{{
if neobundle#tap('vim-quickhl')
  " keymap
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  nmap <Space>j <Plug>(quickhl-cword-toggle)
  nmap <Space>] <Plug>(quickhl-tag-toggle)

  call neobundle#untap()
endif " }}}

" 2html.vim {{{
let g:html_font = 'Inconsolata'',''Migu 1M'
" }}}

" vim-altr {{{
if neobundle#tap('vim-altr')
  " keymap
  nmap <F2> <Plug>(altr-forward)
  nmap <S-F2> <Plug>(altr-back)

  " define
  call altr#define('%.go', '%_test.go')

  call neobundle#untap()
endif " }}}

" vim-asterisk {{{
if neobundle#tap('vim-asterisk')
  " enable keepCursor feature
  let g:asterisk#keeppos = 1

  " keymap
  map *   <Plug>(asterisk-*)
  map #   <Plug>(asterisk-#)
  map g*  <Plug>(asterisk-g*)
  map g#  <Plug>(asterisk-g#)
  map z*  <Plug>(asterisk-z*)
  map gz* <Plug>(asterisk-gz*)
  map z#  <Plug>(asterisk-z#)
  map gz# <Plug>(asterisk-gz#)

  call neobundle#untap()
endif "}}}

" vim-clang {{{
if neobundle#tap('vim-clang')
  let g:clang_auto = 0
  let g:clang_c_options = '-std=c11'
  let g:clang_cpp_options = '-std=c++14'

  let g:clang_format_style = '"{'
        \ .'AccessModifierOffset: -4,'
        \ .'AllowShortIfStatementsOnASingleLine: false,'
        \ .'AllowShortLoopsOnASingleLine: false,'
        \ .'BasedOnStyle: Google,'
        \ .'IndentWidth: 4,'
        \ .'}"'

  call neobundle#untap()
endif "}}}

" vim-go-extra {{{
if neobundle#tap('vim-go-extra')
  if executable('goimports')
    let g:gofmt_command='goimports'
  endif

  if neobundle#is_installed('vimproc')
    let g:gocomplete#system_function='vimproc#system2'
  endif

  call neobundle#untap()
endif "}}}

" vim-operator-replace {{{
if neobundle#tap('vim-operator-replace')
  " keymap
  map _ <Plug>(operator-replace)

  call neobundle#untap()
endif " }}}

" vim-operator-surround {{{
if neobundle#tap('vim-operator-surround')
  " keymap
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)

  call neobundle#untap()
endif " }}}

" vim-quickrun {{{
if neobundle#tap('vim-quickrun')
  " async run
  let g:quickrun_config={
        \ '_': {
        \       'runner': 'vimproc',
        \       'runner/vimproc/updatetime': 500,
        \       'hook/output_encode/encoding': '&termencoding',
        \ },
        \ 'c': {
        \       'cmdopt': '-std=c11',
        \ },
        \ 'cpp': {
        \       'cmdopt': '-std=c++14',
        \ },
        \ 'go.test': {
        \       'cmdopt': 'test -v',
        \       'command': 'go',
        \       'exec': '%c %o',
        \       'hook/cd/directory': '%S:h',
        \ }}

  " keymap
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : '\<C-c>'
  call neobundle#untap()
endif " }}}

" vim-reanimate {{{
if neobundle#tap('vim-reanimate')
  if isdirectory(expand(s:share_dir))
    let g:reanimate_save_dir=expand(s:share_dir . '/.vim/reanimate')
  else
    let g:reanimate_save_dir=expand(s:vimfiles . '/reanimate')
  endif

  let g:reanimate_sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize'

  " complete func
  function! s:save_point_completelist(arglead, ...)
    return filter(reanimate#save_points(), "v:val =~? '".a:arglead."'")
  endfunction

  " define memo command
  function! s:reanimate_edit_memo(...) abort
    let point = a:0 ? a:1 : reanimate#last_point()
    let target = reanimate#point_to_path(point)."/"."memo.md"
    execute "split" target
  endfunction

  command! -nargs=? -complete=customlist,s:save_point_completelist
        \ ReanimateEditMemo
        \ call s:reanimate_edit_memo()

  call neobundle#untap()
endif "}}}

" vim-submode {{{
if neobundle#tap('vim-submode')
  " window size
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('winsize', 'n', '', '>', '<C-w>>')
  call submode#map('winsize', 'n', '', '<', '<C-w><')
  call submode#map('winsize', 'n', '', '+', '<C-w>+')
  call submode#map('winsize', 'n', '', '-', '<C-w>-')

  call neobundle#untap()
endif " }}}

" vim-textobj-between {{{
if neobundle#tap('vim-textobj-between')
  " disable default keymap
  let g:textobj_between_no_default_key_mappings=1

  " keymap
  omap aS <Plug>(textobj-between-a)
  xmap aS <Plug>(textobj-between-a)
  omap iS <Plug>(textobj-between-i)
  xmap iS <Plug>(textobj-between-i)

  call neobundle#untap()
endif " }}}

" unite.vim {{{
if neobundle#tap('unite.vim')
  let g:unite_source_line_enable_highlight=1

  " keymap
  nnoremap [unite] <Nop>
  nmap  <Space>u [unite]

  " resume
  nnoremap <silent> [unite]r :<C-u>UniteResume<CR>
  " buffer
  nnoremap <silent> [unite]b :<C-u>Unite buffer file_mru -start-insert<CR>
  " change
  nnoremap <silent> [unite]g; :<C-u>Unite -buffer-name=change change<CR>
  " jump
  nnoremap <silent> [unite]g<C-o> :<C-u>Unite -buffer-name=jump jump<CR>
  " line
  nnoremap <silent> [unite]/ :<C-u>Unite -buffer-name=line line -start-insert -no-quit<CR>
  " grep
  nnoremap <silent> [unite]gr :<C-u>Unite -buffer-name=grep grep -start-insert -no-quit<CR>

  call neobundle#untap()
endif " }}}

" unite-outline {{{
if neobundle#tap('unite-outline')
  nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline -start-insert<CR>

  call neobundle#untap()
endif "}}}
" }}}


" local settings {{{
" secret
if filereadable(expand('~/.vimrc_secret'))
  execute 'source' expand('~/.vimrc_secret')
endif

" project local
" vim-jp Hack #112
augroup vimrc_local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files=findfile('.vimrc_local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" }}}


" autocmd {{{
augroup vimrc_loading
  autocmd!

  " do not move when copen
  function! s:nomove_copen()
    let curbuf = bufwinnr('%')
    copen
    execute curbuf . 'wincmd w'
  endfunction
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep call s:nomove_copen()

  " FileType
  " golang
  autocmd FileType go setlocal noexpandtab
  autocmd BufWinEnter,BufNewFile *_test.go setlocal filetype=go.test
  " vim
  autocmd FileType vim setlocal shiftwidth=2 softtabstop=2
augroup END
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
