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

let s:plugin_root_dir = s:vimfiles . '/bundle'
" }}}

" functions {{{
function! s:is_installed(plugname) abort
  return !len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
endfunction

function! s:is_loaded(plugname) abort
  return stridx(&rtp, g:plugs, g:plugs[a:plugname].dir) >= 0
endfunction
" }}}

" initialization {{{
" language
language C
set langmenu=none

if has('vim_starting')
  let &runtimepath.=',' . s:plugin_root_dir . '/vim-plug'
endif

" vim-plug {{{
call plug#begin(s:plugin_root_dir)
Plug 'KabbAmine/zeavim.vim'
if has('lua')
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplcache.vim'
endif
Plug 'Shougo/neosnippet.vim'
      \ |
      \ Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
      \ |
      \ Plug 'Shougo/junkfile.vim'
      \ |
      \ Plug 'Shougo/neomru.vim'
      \ |
      \ Plug 'Shougo/unite-help'
      \ |
      \ Plug 'Shougo/unite-outline'
      \ |
      \ Plug 'Shougo/vimfiler', {
      \ 'on': ['VimFiler', 'VimFilerExplorer', 'VimFilerTab'],
      \ }
      \ |
      \ Plug 'osyo-manga/unite-quickfix'
      \ |
      \ Plug 'ujihisa/unite-colorscheme'
Plug 'Shougo/vimproc.vim', {
      \ 'do': 'make',
      \ }
Plug 'aklt/plantuml-syntax'
Plug 'blyoa/vim-nearest-g', {
      \ 'on': '<Plug>nearest-g:neighbor',
      \ }
Plug 'blyoa/vim-promela-syntax', {
      \ 'for': 'promela'
      \ }
Plug 'chrisbra/vim-diff-enhanced', {
      \ 'on': ['EnhancedDiff', 'PatienceDiff'],
      \ }
Plug 'cohama/vim-hier'
Plug 'ctrlpvim/ctrlp.vim'
      \ |
      \ Plug 'blyoa/ctrlp-history'
      \ |
      \ Plug 'mattn/ctrlp-register'
Plug 'davidhalter/jedi-vim', {
      \ 'for': ['python', 'python3'],
      \ }
Plug 'dhruvasagar/vim-table-mode'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'glidenote/memolist.vim', {
      \ 'on': ['MemoNew', 'MemoList', 'MemoGrep'],
      \ }
Plug 'hail2u/vim-css3-syntax', {
      \ 'for': ['css', 'sass', 'scss', 'less'],
      \ }
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk', {
      \ 'on': '<Plug>(asterisk-',
      \ }
Plug 'hynek/vim-python-pep8-indent', {
      \ 'for': ['python', 'python3', 'djangohtml'],
      \ }
Plug 'itchyny/calendar.vim', {
      \ 'on': ['Calendar'],
      \ }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align', {
      \ 'on': ['EasyAlign', 'LiveEasyAlign',
      \        '<Plug>EasyAlign', '<Plug>LiveEasyAlign'],
      \ }
Plug 'justmao945/vim-clang', {
      \ 'for': ['c', 'cpp']
      \ }
Plug 'kana/vim-altr'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
      \ |
      \ Plug 'kana/vim-operator-replace'
      \ |
      \ Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-textobj-user'
      \ |
      \ Plug 'kana/vim-textobj-indent'
      \ |
      \ Plug 'thinca/vim-textobj-between'
Plug 'kana/vim-submode'
Plug 'lervag/vimtex', {
      \ 'for': ['tex'],
      \ }
Plug 'mattn/emmet-vim', {
      \ 'for': ['html', 'djangohtml',
      \         'css', 'sass', 'scss', 'less'],
      \ }
Plug 'mattn/sonictemplate-vim'
if executable('ag') || executable('ack')
  Plug 'mileszs/ack.vim', {
        \ 'on' : ['Ack', 'AckAdd', 'LAck', 'LAckAdd']
        \ }
endif
Plug 'osyo-manga/vim-reanimate', {
      \ 'on': ['ReanimateLoad', 'ReanimateLoadLatest',
      \        'ReanimateSave', 'ReanimateSwitch'],
      \ }
Plug 'othree/html5.vim', {
      \ 'for': ['html', 'djangohtml'],
      \ }
Plug 'pangloss/vim-javascript', {
      \ 'for': ['html', 'djangohtml', 'javascript'],
      \ }
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-qfreplace', {
      \ 'for': ['unite', 'quickfix'],
      \ }
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tyru/capture.vim', {
      \ 'on': ['Capture',],
      \ }
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim', {
      \ 'on': '<Plug>(openbrowser-',
      \ }
      \ | Plug 'kannokanno/previm', {
      \     'for': ['markdown', 'mkd', 'rst'],
      \   }
Plug 'vim-jp/vim-go-extra', {
      \ 'for': ['go'],
      \ }
Plug 'vim-scripts/matchit.zip'
call plug#end()

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
" }}}

" keymap {{{
" see dos-standard-mappings
silent! vunmap <C-x>

nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap <C-j> :<C-u>cnext<CR>
nnoremap <C-k> :<C-u>cprevious<CR>
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

" ack.vim {{{
if s:is_installed('ack.vim')
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
  let g:ackhighlight = 1
endif "}}}

" calendar.vim {{{
if s:is_installed('calendar.vim')
  let g:calendar_first_day = 'sunday'
  let g:calendar_time_zone = "+0900"
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1
endif "}}}

" caw.vim {{{
if s:is_installed('caw.vim')
  " keymap
  nmap <Leader>c <Plug>(caw:zeropos:toggle)
  vmap <Leader>c <Plug>(caw:zeropos:toggle)

endif " }}}

" ctrlp.vim {{{
if s:is_installed('ctrlp.vim')
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
  if s:is_installed(['ctrlp-history'])
    nnoremap <silent> [ctrlp]c :<C-u>CtrlPCmdHistory<CR>
    nnoremap <silent> [ctrlp]/ :<C-u>CtrlPSearchHistory<CR>
  endif
  " ctrlp-register
  if s:is_installed(['ctrlp-register'])
    nnoremap <silent> [ctrlp]r :<C-u>CtrlPRegister<CR>
  endif

endif "}}}

" emmet-vim {{{
if s:is_installed('emmet-vim')
  let g:user_emmet_settings={
        \ 'variables': {
        \     'lang': 'ja',
        \ }}

endif " }}}

" ft-tex-plugin {{{
let g:tex_flavor = 'latex'
"}}}

" incsearch.vim {{{
if s:is_installed('incsearch.vim')
  " keymap
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

endif "}}}

" memolist.vim {{{
if s:is_installed('memolist.vim')
  " memodir
  if isdirectory(expand(s:share_dir))
    let g:memolist_path=expand(s:share_dir . '/.vim/memolist')
  else
    let g:memolist_path=expand(s:vimfiles . '/memolist')
  endif

  " suffix type
  let g:memolist_memo_suffix='mkd'

  " settings to use unite
  if !s:is_installed(['unite.vim'])
    let g:memolist_unite=1
    let g:memolist_unite_option='-auto-preview'
  endif

endif " }}}

" neocomplcache.vim {{{
if s:is_installed('neocomplcache.vim')
  let g:neocomplcache_enable_at_startup=1

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif

  " golang
  let g:neocomplcache_omni_patterns.go = '[^.[:digit:] *\t]\.\w*'

endif " }}}

" neocomplete.vim {{{
if s:is_installed('neocomplete.vim')
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

  " python
  if s:is_installed('jedi')
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#smart_auto_mappings = 0
    let g:jedi#auto_initialization = 1
    let g:jedi#rename_command = "<leader>R"
    let g:jedi#popup_on_dot = 1
    let g:jedi#force_py_version=3
    let g:neocomplete#force_omni_input_patterns.python =
          \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  endif
endif " }}}

" lightline.vim {{{
if s:is_installed('lightline.vim')
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
  if s:is_installed(['ctrlp.vim'])
    let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
    function! CtrlPEnter() abort
      let w:lightline = 0
    endfunction
  endif

endif "}}}

" neosnippet.vim {{{
if s:is_installed('neosnippet.vim')
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
if s:is_installed('open-browser.vim')
  " disable netrw's gx mapping
  let g:netw_nogx=1
  let g:openbrowser_search_engines = {
              \ 'weblio': 'http://ejje.weblio.jp/content/{query}',
              \ }

  " keymap
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  function! s:weblio_search() abort
    call plug#load('open-browser.vim')
    let save_engine = g:openbrowser_default_search
    let g:openbrowser_default_search = 'weblio'
    execute "normal \<Plug>(openbrowser-smart-search)"
    let g:openbrowser_default_search = save_engine
  endfunction

  nmap gs :<C-u>call <SID>weblio_search()<CR>
  vmap gs :<C-u>'<,'>call <SID>weblio_search()<CR>

endif " }}}

" plantuml-syntax {{{
if s:is_installed('plantuml-syntax')
  let g:plantuml_executable_script = 'java -jar ' . expand('$HOME') . '/utils/bin/plantuml.jar -Tsvg'
endif "}}}

" quickhl {{{
if s:is_installed('vim-quickhl')
  " keymap
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  nmap <Space>j <Plug>(quickhl-cword-toggle)
  nmap <Space>] <Plug>(quickhl-tag-toggle)

endif " }}}

" unite.vim {{{
if s:is_installed('unite.vim')
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
if s:is_installed('unite-outline')
  nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline -start-insert<CR>

endif "}}}

" vim-altr {{{
if s:is_installed('vim-altr')
  " keymap
  nmap <F2> <Plug>(altr-forward)
  nmap <S-F2> <Plug>(altr-back)

  " define
  call altr#define('%.go', '%_test.go')

endif " }}}

" vim-asterisk {{{
if s:is_installed('vim-asterisk')
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
if s:is_installed('vim-clang')
  let g:clang_auto = 0
  let g:clang_c_options = '-std=c11'
  let g:clang_cpp_options = '-std=c++14'

  let g:clang_format_style = '{'
        \ .'AccessModifierOffset: -4,'
        \ .'AllowShortIfStatementsOnASingleLine: false,'
        \ .'AllowShortLoopsOnASingleLine: false,'
        \ .'BasedOnStyle: Google,'
        \ .'IndentWidth: 4,'
        \ .'}'

endif "}}}

" vim-go-extra {{{
if s:is_installed('vim-go-extra')
  if executable('goimports')
    let g:gofmt_command='goimports'
  endif

  if s:is_installed(['vimproc'])
"     let g:gocomplete#system_function='vimproc#system2'
  endif

endif "}}}

" vim-nearest-g {{{
if s:is_installed('vim-nearest-g')
  nmap gl <Plug>(nearest-g:neighbor)
endif "}}}

" vim-operator-replace {{{
if s:is_installed('vim-operator-replace')
  " keymap
  map _ <Plug>(operator-replace)

endif " }}}

" vim-operator-surround {{{
if s:is_installed('vim-operator-surround')
  " keymap
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)

endif " }}}

" vim-quickrun {{{
if s:is_installed('vim-quickrun')
  " async run
  let g:quickrun_config={
        \ '_': {
        \       'runner': 'job',
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
if s:is_installed('vim-reanimate')
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
if s:is_installed('vim-submode')
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
if s:is_installed('vim-textobj-between')
  " disable default keymap
  let g:textobj_between_no_default_key_mappings=1

  " keymap
  omap aS <Plug>(textobj-between-a)
  xmap aS <Plug>(textobj-between-a)
  omap iS <Plug>(textobj-between-i)
  xmap iS <Plug>(textobj-between-i)

endif " }}}

" vimtex {{{
if s:is_installed('vimtex')
  let g:vimtex_imaps_enabled=0
  let g:vimtex_motion_matchparen = 0
  let g:vimtex_compiler_latexmk = {
        \ 'backends': 'job',
        \ 'options' : [
        \   '-pdfdvi',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

  if executable('SumatraPDF')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n --remote-silent +\%l \"\%f\"" -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
  else
    let g:vimtex_view_enabled = 0
  endif

endif "}}}


" zeavim.vim {{{
if s:is_installed('zeavim.vim')
  if executable('zeal')
    let g:zv_zeal_executable = exepath('zeal')
  elseif has('win64')
    let g:zv_zeal_executable = 'C:\Program Files (x86)\Zeal\zeal.exe'
  elseif has('win32')
    let g:zv_zeal_executable = 'C:\Program Files\Zeal\zeal.exe'
  endif
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
  " html
  autocmd FileType html setlocal shiftwidth=2 softtabstop=2
  " css
  autocmd FileType css setlocal shiftwidth=2 softtabstop=2
  " javascript
  autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
  " markdown
  autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2
  " yaml
  autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2
  " tex
  autocmd FileType tex setlocal shiftwidth=2 softtabstop=2
augroup END
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
