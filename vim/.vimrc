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

let s:dein_base_path = s:vimfiles . '/bundle'
" }}}

" initialization {{{
" language
language C
set langmenu=none

if has('vim_starting')
  let &runtimepath.=',' . s:dein_base_path . '/repos/github.com/Shougo/dein.vim'
endif

" dein {{{
if dein#load_state(expand(s:dein_base_path))
  call dein#begin(expand(s:dein_base_path))
  call dein#add('matchit.zip')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neosnippet.vim', {
        \ 'on_ft': 'snippet',
        \ 'on_i': 1,
        \ })
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc.vim', {
        \ 'build': 'make',
        \ })
  call dein#add('Shougo/unite.vim', {
        \ 'on_cmd': ['Unite', 'UniteWithCursorWord', 'UniteWithInput'],
        \ })
  call dein#add('Shougo/junkfile.vim', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('Shougo/neomru.vim', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('Shougo/unite-help', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('Shougo/unite-outline', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('osyo-manga/unite-quickfix', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('ujihisa/unite-colorscheme', {
        \ 'depends': 'unite.vim',
        \ })
  call dein#add('Shougo/neocomplete.vim', {
        \ 'if': has('lua'),
        \ 'on_i': 1,
        \ })
  call dein#add('Shougo/neocomplcache.vim', {
        \ 'if': !has('lua'),
        \ 'on_i': 1,
        \ })
  call dein#add('Shougo/vimfiler', {
        \ 'on_cmd': ['VimFiler', 'VimFilerExplorer', 'VimFilerTab'],
        \ })
  call dein#add('Shougo/vimshell.vim', {
        \ 'on_cmd': ['VimShell', 'VimShellExecute', 'VimShellInteractive',
        \            'VimShellPop'],
        \ })
  call dein#add('blyoa/pas.vim', {
        \ 'on_map': '<Plug>(pas-',
        \ })
  call dein#add('blyoa/vim-promela-syntax', {
        \ 'on_ft': 'promela'
        \ })
  call dein#add('chrisbra/vim-diff-enhanced', {
        \ 'on_cmd': ['EnhancedDiff', 'PatienceDiff'],
        \ })
  call dein#add('cohama/vim-hier')
  call dein#add('ctrlpvim/ctrlp.vim', {
        \ 'on_cmd': ['CtrlP', 'CtrlPMixed', 'CtrlPBuffer', 'CtrlPMRUFiles'],
        \ })
  call dein#add('blyoa/ctrlp-history', {
        \ 'depends': 'ctrlp.vim',
        \ 'on_cmd': ['CtrlPCmdHistory', 'CtrlPSearchHistory',],
        \ })
  call dein#add('mattn/ctrlp-register', {
        \ 'depends': 'ctrlp.vim',
        \ 'on_cmd': ['CtrlPRegister'],
        \ })
  call dein#add('mattn/sonictemplate-vim', {
        \ 'on_ft': 'all',
        \ })
  call dein#add('deris/vim-visualinc')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('glidenote/memolist.vim', {
        \ 'on_cmd': ['MemoNew', 'MemoList', 'MemoGrep'],
        \ })
  call dein#add('hail2u/vim-css3-syntax', {
        \ 'on_ft': ['css', 'sass', 'scss', 'less'],
        \ })
  call dein#add('haya14busa/incsearch.vim', {
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('haya14busa/vim-asterisk', {
        \ 'on_map': '<Plug>(asterisk-',
        \ })
  call dein#add('hynek/vim-python-pep8-indent', {
        \ 'on_ft': ['python', 'python3', 'djangohtml'],
        \ 'on_i': 1,
        \ })
  call dein#add('itchyny/calendar.vim', {
        \ 'on_cmd': ['Calendar'],
        \ })
  call dein#add('itchyny/lightline.vim')
  call dein#add('junegunn/vim-easy-align', {
        \ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
        \ 'on_map': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
        \ })
  call dein#add('justmao945/vim-clang', {
        \ 'on_ft': ['c', 'cpp']
        \ })
  call dein#add('KabbAmine/zeavim.vim', {
        \ 'on_map': ['<Leader>z', '<Leader>Z'],
        \ })
  call dein#add('kana/vim-niceblock')
  call dein#add('kana/vim-altr')
  call dein#add('kana/vim-operator-user', {
        \ 'on_func': 'operator#user#define',
        \ })
  call dein#add('kana/vim-operator-replace', {
        \ 'depends': 'vim-operator-user',
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('rhysd/vim-operator-surround', {
        \ 'depends': 'vim-operator-user',
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-indent', {
        \ 'depends': 'vim-textobj-user',
        \ })
  call dein#add('thinca/vim-textobj-between', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('kana/vim-submode')
  call dein#add('lervag/vimtex', {
        \ 'on_ft': ['tex'],
        \ })
  call dein#add('lilydjwg/colorizer', {
        \ 'on_ft': ['html', 'djangohtml',
        \           'css', 'sass', 'scss', 'less'],
        \ })
  call dein#add('mattn/emmet-vim', {
        \ 'on_ft': ['html', 'djangohtml',
        \           'css', 'sass', 'scss', 'less'],
        \ })
  call dein#add('osyo-manga/vim-reanimate', {
        \ 'on_cmd': ['ReanimateLoad', 'ReanimateLoadLatest',
        \            'ReanimateSave', 'ReanimateSwitch'],
        \ })
  call dein#add('othree/html5.vim', {
        \ 'on_ft': ['html', 'djangohtml'],
        \ })
  call dein#add('pangloss/vim-javascript', {
        \ 'on_ft': ['html', 'djangohtml', 'javascript'],
        \ })
  call dein#add('t9md/vim-quickhl', {
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('thinca/vim-qfreplace', {
        \ 'on_ft': ['unite', 'quickfix'],
        \ })
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-ref')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/capture.vim', {
        \ 'on_cmd': ['Capture',],
        \ })
  call dein#add('tyru/caw.vim', {
        \ 'on_map': '<Plug>',
        \ })
  call dein#add('tyru/open-browser.vim', {
        \ 'on_map': '<Plug>(openbrowser-',
        \ })
  call dein#add('kannokanno/previm', {
        \ 'depends': 'open-browser.vim',
        \ 'on_ft': ['markdown', 'mkd', 'rst'],
        \ })
  call dein#add('vim-jp/vim-go-extra', {
        \ 'on_ft': ['go'],
        \ })
  call dein#end()
  call dein#save_state()
endif

function! s:dein_check_install() abort
  if !dein#check_install()
    return
  endif

  if input("Do you want to install new plugins? [y/n]") ==# 'y'
    call dein#install()
  endif
endfunction

if dein#check_install()
  augroup dein_check_install
    autocmd!
    autocmd VimEnter * call s:dein_check_install()
  augroup END
endif

" }}}

filetype plugin indent on

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

" markdown
let g:markdown_fenced_languages = [
      \ 'bash=sh',
      \ 'c',
      \ 'cpp',
      \ 'cs',
      \ 'csharp=cs',
      \ 'css',
      \ 'diff',
      \ 'go',
      \ 'golang=go',
      \ 'html',
      \ 'java',
      \ 'javascript',
      \ 'js=javascript',
      \ 'json',
      \ 'latex=tex',
      \ 'perl',
      \ 'promela',
      \ 'python',
      \ 'ruby',
      \ 'sh',
      \ 'tex',
      \ 'vim',
      \ 'xml',
      \ 'yaml',
      \ 'zsh',
      \ ]

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
if dein#tap('calendar.vim')
  let g:calendar_first_day = 'sunday'
  let g:calendar_time_zone = 9
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
endif "}}}

" caw.vim {{{
if dein#tap('caw.vim')
  " keymap
  nmap <Leader>c <Plug>(caw:zeropos:toggle)
  vmap <Leader>c <Plug>(caw:zeropos:toggle)

endif " }}}

" ctrlp.vim {{{
if dein#tap('ctrlp.vim')
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
  " ctrlp-history
  if !dein#check_install(['ctrlp-history'])
    nnoremap <silent> [ctrlp]c :<C-u>CtrlPCmdHistory<CR>
    nnoremap <silent> [ctrlp]/ :<C-u>CtrlPSearchHistory<CR>
  endif
  " ctrlp-register
  if !dein#check_install(['ctrlp-register'])
    nnoremap <silent> [ctrlp]r :<C-u>CtrlPRegister<CR>
  endif

endif "}}}

" emmet-vim {{{
if dein#tap('emmet-vim')
  let g:user_emmet_settings={
        \ 'variables': {
        \     'lang': 'ja',
        \ }}

endif " }}}

" ft-tex-plugin {{{
let g:tex_flavor = 'latex'
"}}}

" incsearch.vim {{{
if dein#tap('incsearch.vim')
  " keymap
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

endif "}}}

" memolist.vim {{{
if dein#tap('memolist.vim')
  " memodir
  if isdirectory(expand(s:share_dir))
    let g:memolist_path=expand(s:share_dir . '/.vim/memolist')
  else
    let g:memolist_path=expand(s:vimfiles . '/memolist')
  endif

  " suffix type
  let g:memolist_memo_suffix='mkd'

  " settings to use unite
  if !dein#check_install(['unite.vim'])
    let g:memolist_unite=1
    let g:memolist_unite_option='-auto-preview'

    augroup dein_memolist_on_source
      autocmd!
      execute 'autocmd User dein#source#' . dein#name
            \ 'call dein#source("unite.vim")' 
    augroup END
  endif

endif " }}}

" neocomplcache.vim {{{
if dein#tap('neocomplcache.vim')
  let g:neocomplcache_enable_at_startup=1

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif

  " golang
  let g:neocomplcache_omni_patterns.go = '[^.[:digit:] *\t]\.\w*'

endif " }}}

" neocomplete.vim {{{
if dein#tap('neocomplete.vim')
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
  " tex
  let g:neocomplete#sources#omni#input_patterns.tex =
        \ '\v\\%('
        \ . '\a*%(ref|cite)\a*%(\s*\[[^]]*\])?\s*\{[^{}]*'
        \ . '|includegraphics%(\s*\[[^]]*\])?\s*\{[^{}]*'
        \ . '|%(include|input)\s*\{[^{}]*'
        \ . ')'

endif " }}}

" lightline.vim {{{
if dein#tap('lightline.vim')
  let g:lightline={
        \ 'colorscheme': 'Tomorrow_Night',
        \ 'active': {
        \   'left': [[], ['preview', 'filename', 'modified', 'readonly',]],
        \   'right': [['linenr'], ['winnr'], ['filetype', 'fenc_ff',]],
        \ },
        \ 'inactive': {
        \   'left': [['filename', 'modified', 'readonly',]],
        \   'right': [['linenr'], ['winnr'], ['filetype', 'fenc_ff',]],
        \ },
        \ 'component': {
        \  'filetype': '%{&ft}',
        \  'fenc_ff': '%{(&fenc!=""?&fenc:&enc).(&bomb?"(BOM)":"").",".&ff}',
        \  'filename': '%{expand("%:p:.")}',
        \  'linenr': '%{printf("%3d/%d", line("."), line("$"))}',
        \  'preview': '%w',
        \  'readonly': '%r',
        \  'winnr': '%{winnr()}',
        \ },
        \ 'component_visible_condition': {
        \   'preview': '&previewwindow',
        \ },
        \ }

  " avoid overwriting statusline ctrlp.vim
  if !dein#check_install(['ctrlp.vim'])
    let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
    function! CtrlPEnter() abort
      let w:lightline = 0
    endfunction
  endif

endif "}}}

" neosnippet.vim {{{
if dein#tap('neosnippet.vim')
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

endif " }}}

" openbrowser.vim {{{
if dein#tap('open-browser.vim')
  " disable netrw's gx mapping
  let g:netw_nogx=1

  " keymap
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

endif " }}}

" pas.vim {{{
if dein#tap('pas.vim')
  nmap vp <Plug>(pas-p-as-v)
  nmap vP <Plug>(pas-P-as-v)
  nmap Vp <Plug>(pas-p-as-V)
  nmap VP <Plug>(pas-P-as-V)
  nmap <C-v>p <Plug>(pas-p-as-ctrlv)
  nmap <C-v>P <Plug>(pas-P-as-ctrlv)
endif "}}}

" quickhl {{{
if dein#tap('vim-quickhl')
  " keymap
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  nmap <Space>j <Plug>(quickhl-cword-toggle)
  nmap <Space>] <Plug>(quickhl-tag-toggle)

endif " }}}

" 2html.vim {{{
let g:html_font = 'Inconsolata'',''Migu 1M'
" }}}

" vim-altr {{{
if dein#tap('vim-altr')
  " keymap
  nmap <F2> <Plug>(altr-forward)
  nmap <S-F2> <Plug>(altr-back)

  " define
  call altr#define('%.go', '%_test.go')

endif " }}}

" vim-asterisk {{{
if dein#tap('vim-asterisk')
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

endif "}}}

" vim-clang {{{
if dein#tap('vim-clang')
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

endif "}}}

" vim-go-extra {{{
if dein#tap('vim-go-extra')
  if executable('goimports')
    let g:gofmt_command='goimports'
  endif

  if !dein#check_install(['vimproc'])
    let g:gocomplete#system_function='vimproc#system2'
  endif

endif "}}}

" vim-operator-replace {{{
if dein#tap('vim-operator-replace')
  " keymap
  map _ <Plug>(operator-replace)

endif " }}}

" vim-operator-surround {{{
if dein#tap('vim-operator-surround')
  " keymap
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)

endif " }}}

" vim-quickrun {{{
if dein#tap('vim-quickrun')
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
endif " }}}

" vim-reanimate {{{
if dein#tap('vim-reanimate')
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

endif "}}}

" vim-submode {{{
if dein#tap('vim-submode')
  " window size
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('winsize', 'n', '', '>', '<C-w>>')
  call submode#map('winsize', 'n', '', '<', '<C-w><')
  call submode#map('winsize', 'n', '', '+', '<C-w>+')
  call submode#map('winsize', 'n', '', '-', '<C-w>-')

endif " }}}

" vim-textobj-between {{{
if dein#tap('vim-textobj-between')
  " disable default keymap
  let g:textobj_between_no_default_key_mappings=1

  " keymap
  omap aS <Plug>(textobj-between-a)
  xmap aS <Plug>(textobj-between-a)
  omap iS <Plug>(textobj-between-i)
  xmap iS <Plug>(textobj-between-i)

endif " }}}

" vimtex {{{
if dein#tap('vimtex')
  let g:vimtex_motion_matchparen = 0
  let g:vimtex_latexmk_options='-pdfdvi'

  if executable('SumatraPDF')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n --remote-silent +\%l \"\%f\"" -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
  else
    let g:vimtex_view_enabled = 0
  endif

endif "}}}

" unite.vim {{{
if dein#tap('unite.vim')
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

endif " }}}

" unite-outline {{{
if dein#tap('unite-outline')
  nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline -start-insert<CR>

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
