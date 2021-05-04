if !1 | finish | endif


" variables {{{
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = has('macunix')

let s:share_dir='~/Dropbox/sync'
let s:vimfiles='~/.vim'
" for portable use
"let s:vimfiles=$VIM . '/.vim'

let s:plugin_root_dir = s:vimfiles . '/bundle'
" }}}

" functions {{{
function! s:is_installed(plugname) abort
  return has_key(g:plugs, a:plugname) && isdirectory(g:plugs[a:plugname]['dir'])
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
  let &runtimepath = s:vimfiles . '/config,' . &runtimepath
  let &runtimepath .= ',' . s:plugin_root_dir . '/vim-plug'
  let &runtimepath .= ',' . s:vimfiles . '/config/after'
endif

" vim-plug {{{
call plug#begin(s:plugin_root_dir)
Plug 'KabbAmine/zeavim.vim'
Plug 'PProvost/vim-ps1'
Plug 'Shougo/junkfile.vim'
Plug 'Shougo/unite.vim'
      \ | Plug 'Shougo/neomru.vim'
      \ | Plug 'Shougo/unite-outline'
Plug 'Shougo/vimproc.vim', {
      \ 'do': 'make',
      \ }
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'
Plug 'blyoa/vim-nearest-g', {
      \ 'on': '<Plug>nearest-g:neighbor',
      \ }
Plug 'blyoa/vim-promela-syntax', {
      \ 'for': 'promela'
      \ }
Plug 'cespare/vim-toml'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cocopon/iceberg.vim'
Plug 'cohama/vim-hier'
Plug 'ctrlpvim/ctrlp.vim'
      \ | Plug 'blyoa/ctrlp-history'
      \ | Plug 'mattn/ctrlp-register'
Plug 'dhruvasagar/vim-table-mode'
Plug 'digitaltoad/vim-pug'
Plug 'evanleck/vim-svelte'
Plug 'gf3/peg.vim'
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
Plug 'hokorobi/plantuml-syntax', {
      \ 'branch': 'experiment',
      \ }
Plug 'hynek/vim-python-pep8-indent', {
      \ 'for': ['python', 'python3', 'djangohtml'],
      \ }
Plug 'iamcco/markdown-preview.nvim', {
      \ 'do': { -> mkdp#util#install() }
      \ }
Plug 'inkarkat/vim-mark' |
      \ Plug 'inkarkat/vim-ingo-library'
Plug 'itchyny/calendar.vim', {
      \ 'on': ['Calendar'],
      \ }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align', {
      \ 'on': ['EasyAlign', 'LiveEasyAlign',
      \        '<Plug>EasyAlign', '<Plug>LiveEasyAlign'],
      \ }
Plug 'kana/vim-altr'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
      \ | Plug 'kana/vim-operator-replace'
Plug 'kana/vim-textobj-user'
      \ | Plug 'kana/vim-textobj-indent'
      \ | Plug 'thinca/vim-textobj-between'
      \ | Plug 'kana/vim-textobj-line'
Plug 'kana/vim-submode'
if s:is_windows
  Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
endif
Plug 'lambdalisue/fern.vim' |
      \ Plug 'lambdalisue/fern-hijack.vim' |
      \ Plug 'lambdalisue/fern-bookmark.vim' 
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex', {
      \ 'for': ['tex'],
      \ }
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim', {
      \ 'for': ['html', 'djangohtml',
      \         'css', 'sass', 'scss', 'less'],
      \ }
Plug 'mattn/vim-goaddtags', {
      \ 'for': ['go']
      \ }
Plug 'mattn/vim-goimpl', {
      \ 'for': ['go']
      \ }
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/vim-xxdcursor', {
      \ 'for': ['xxd'],
      \ }
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
Plug 'plasticboy/vim-markdown', {
      \ 'for': ['markdown'],
      \ }
Plug 'posva/vim-vue', {
      \ 'for': ['vue']
      \ }
Plug 'prabirshrestha/vim-lsp'
      \ | Plug 'prabirshrestha/async.vim'
      \ | Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
      \ | Plug 'prabirshrestha/asyncomplete-lsp.vim'
      \ | Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
      \ | Plug 'Shougo/neosnippet.vim'
      \ | Plug 'Shougo/neosnippet-snippets'
Plug 'racer-rust/vim-racer', {
      \ 'for': ['rust'],
      \ }
Plug 'rhysd/vim-goyacc'
Plug 'rust-lang/rust.vim', {
      \ 'for': ['rust'],
      \ }
Plug 'sgur/vim-editorconfig'
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
Plug 'tyru/open-browser.vim'
      \ | Plug 'previm/previm', {
      \     'for': ['markdown', 'mkd', 'rst', 'asciidoc'],
      \   }
Plug 'vim-test/vim-test'
Plug 'vimwiki/vimwiki', {
      \ 'branch': 'dev',
      \ }
Plug 'w0rp/ale'
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
set termguicolors
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
set completeslash=slash

" colorscheme
syntax enable
set synmaxcol=500
if !s:is_windows || has('gui_running')
  colorscheme iceberg
  hi! link Conceal Delimiter
endif

" window
set splitbelow
set splitright
set previewheight=10

" indent
set tabstop=2
set shiftwidth=2
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

" diff
set diffopt+=internal,algorithm:histogram

" misc
set hidden
set backspace=indent,eol,start
set nowildmenu
set wildmode=list:longest,full
set history=10000
set cryptmethod=blowfish2

" motion
set nostartofline
" }}}

" syntax setting {{{
function! s:asciidoc_syn() abort
  syn match myAsciidocTextAttribute /#\S.\{-}#/
  hi link myAsciidocTextAttribute Special
  syn region asciidocList start=/^\s*\(-\|\*\{1,5}\)\s/ start=/^\s*\(\(\d\+\.\)\|\.\{1,5}\|\(\a\.\)\|\([ivxIVX]\+)\)\)\s\+/ start=/.\+\(:\{2,4}\|;;\)$/ end=/\(^[=*]\{4,}$\)\@=/ end=/\(^\(+\|--\)\?\s*$\)\@=/ contains=asciidocList.\+,asciidocQuoted.*,asciidocMacroAttributes,asciidocAttribute,myAsciidocTextAttribute
endfunction

augroup asciidoc_rc
  autocmd!
  autocmd BufReadPost,Syntax *.adoc call s:asciidoc_syn()
augroup END
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
endif "}}}

" ale {{{
if s:is_installed('ale')
  let g:ale_disable_lsp = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_lint_delay=1000
  let g:ale_sign_column_always = 0
  let g:ale_sign_error = 'E>'
  let g:ale_sign_warning = 'W>'
  let g:ale_sign_info = 'I>'

  let g:ale_linters = {
        \ 'c': ['clang', 'cppcheck'],
        \ 'cpp': ['clang', 'cppcheck'],
        \ 'go': ['gobuild', 'golint', 'govet', 'gosimple'],
        \ 'vimwiki': ['proselint', 'writegood'],
        \ }
  let g:ale_fixers = {
        \ 'c': ['clang-format'],
        \ 'cpp': ['clang-format'],
        \ 'css': ['prettier'],
        \ 'scss': ['prettier'],
        \ 'html': ['prettier'],
        \ 'javascript': ['eslint', 'prettier'],
        \ 'tex': ['latexindent'],
        \ 'bib': ['bibclean'],
        \ 'markdown': ['prettier'],
        \ 'typescript': ['tslint', 'eslint', 'prettier'],
        \ 'json': ['prettier'],
        \ 'yaml': ['prettier'],
        \ 'rust': ['rustfmt'],
        \ 'python': ['yapf', 'isort', 'autopep8'],
        \ 'vue': ['eslint', 'prettier'],
        \ }

  let g:ale_c_cppcheck_options = '--enable=all'
  let g:ale_cpp_cppcheck_options = '--enable=all'
  let g:ale_cpp_clang_options = '--std=c++17 -Wall'
  let g:ale_c_clangformat_options = '-style="{'
        \ .'AccessModifierOffset: -4,'
        \ .'AllowShortIfStatementsOnASingleLine: false,'
        \ .'AllowShortLoopsOnASingleLine: false,'
        \ .'BasedOnStyle: Google,'
        \ .'IndentWidth: 4,'
        \ .'}"'

  if executable('goimports')
    let g:ale_fixers.go = ['goimports', 'gofmt']
  else
    let g:ale_fixers.go = ['gofmt']
  endif
  let g:ale_go_gofmt_options = '-s'

  let g:ale_html_tidy_options = '-c --drop-empty-elements no'

  let g:ale_java_javac_options = '-J-Duser.language=en'

  let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'

  let g:ale_languagetool_executable = 'languagetool-commandline'
  let $REDPEN_HOME = expand('~/.redpen')

  let g:ale_python_flake8_options = '--ignore E124,C0111,D100,D101,D102,D103,D104,D105,D106,D107,E501,W503'
  let g:ale_python_pylint_options = '--disable C0111,C0103,R0903'
  let g:ale_python_mypy_options = '--ignore-missing-imports'
  let g:ale_python_black_options = '--skip-string-normalization'

  nmap <F8> <Plug>(ale_fix)
endif "}}}

" asyncomplete.vim {{{
if s:is_installed('asyncomplete.vim')
  let g:asyncomplete_smart_completion = 0
  let g:asyncomplete_remove_duplicates = 0
  imap <C-Space> <Plug>(asyncomplete_force_refresh)
  inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

  augroup asyncomplete_rc
    autocmd!
    if s:is_installed('asyncomplete-tabnine.vim')
      autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
            \ 'name': 'tabnine',
            \ 'allowlist': ['*'],
            \ 'completor': function('asyncomplete#sources#tabnine#completor'),
            \ 'config': {
              \   'line_limit': 1000,
              \   'max_num_result': 20,
              \  },
              \ }))
    endif
    if s:is_installed('asyncomplete-neosnippet.vim')
      autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
           \ 'name': 'neosnippet',
           \ 'whitelist': ['*'],
           \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
           \ }))
    endif
  augroup END

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
  nmap <Leader>c <Plug>(caw:hatpos:toggle)
  vmap <Leader>c <Plug>(caw:hatpos:toggle)
endif " }}}

" ctrlp.vim {{{
if s:is_installed('ctrlp.vim')
  let g:ctrlp_show_hidden = 0
  " enable extensions
  let g:ctrlp_extensions=['mixed']

  " disable switch buffer
  let g:ctrlp_switch_buffer = ''

  if executable('files')
    let g:ctrlp_user_command = 'files -a -i="(\.git|\.hg|\.svn|_darcs|\.bzr|node_modules)$" %s'
  endif

  " keymap
  let g:ctrlp_map=''
  nnoremap [ctrlp] <Nop>
  nmap  <C-p> [ctrlp]

  nnoremap <silent> [ctrlp]<C-p> :<C-u>CtrlP<CR>
  nnoremap <silent> [ctrlp]m :<C-u>CtrlPBookmarkDir<CR>
  nnoremap <silent> [ctrlp]M :<C-u>CtrlPBookmarkDirAdd!<CR>
  nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
  " ctrlp-history
  if s:is_installed('ctrlp-history')
    nnoremap <silent> [ctrlp]c :<C-u>CtrlPCmdHistory<CR>
    nnoremap <silent> [ctrlp]/ :<C-u>CtrlPSearchHistory<CR>
  endif
  " ctrlp-register
  if s:is_installed('ctrlp-register')
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
  map g/ <Plug>(incsearch-stay)
endif "}}}

" lightline.vim {{{
if s:is_installed('lightline.vim')
  let g:lightline={
        \ 'colorscheme': 'iceberg',
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
  if s:is_installed('ctrlp.vim')
    let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
    function! CtrlPEnter() abort
      let w:lightline = 0
    endfunction
  endif
endif "}}}

"  markdown-preview.nvim {{{
if s:is_installed('markdown-preview.nvim')
let g:mkdp_auto_close = 0
let g:mkdp_command_for_global = 1
let g:mkdp_page_title = '${name}'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {
    \ },
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'disable_filename': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
endif "  }}}

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
  if !s:is_installed('unite.vim')
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

" neosnippet.vim {{{
if s:is_installed('neosnippet.vim')
  " addtional snippet directory
  let g:neosnippet#snippets_directory=s:vimfiles . '/snippets'
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#enable_completed_snippet = 1

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
  let g:plantuml_executable_script = 'plantuml -Tsvg -charset UTF-8'
endif "}}}

" rust.vim {{{
if s:is_installed('rust.vim')
  let g:rust_playpen_url = ''
  augroup rust_vim_rc
    autocmd!
    autocmd Filetype rust command! RustPlay echoe 'diabled'
  augroup END

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
  let g:clang_cpp_options = '-std=c++17'
  let g:clang_diagsopt = ''
endif "}}}

" vim-easy-align {{{
if s:is_installed('vim-easy-align')
    let g:easy_align_ignore_groups = []
endif "}}}

" vim-lsp {{{
if s:is_installed('vim-lsp')
  let g:lsp_async_completion = 1
  let g:lsp_preview_float = 0
  let g:lsp_documentation_float = 0
  let g:lsp_preview_keep_focus = 1
  let g:lsp_signature_help_enabled = 0
  let g:lsp_diagnostics_echo_cursor = 1
  augroup vim_lsp_rc
    autocmd!
    autocmd User lsp_buffer_enabled call s:config_lsp()
    let g:lsp_settings = {}
    let g:lsp_settings['efm-langserver'] = {'disabled': v:false}

    let g:lsp_settings['pyls'] = {
          \ 'config': {'pyls': {
          \   'plugins': {
          \     'pycodestyle': {'enabled': v:false},
          \     'pydocstyle': {'enabled': v:false},
          \     'pyflakes': {'enabled': v:false},
          \     'pylint': {'enabled': v:false},
          \     'yapf': {'enabled': v:false},
          \   }
          \ }},
          \ 'workspace_config': {'pyls': {
          \   'plugins': {
          \     'pycodestyle': {'enabled': v:false},
          \     'pydocstyle': {'enabled': v:false},
          \     'pyflakes': {'enabled': v:false},
          \     'pylint': {'enabled': v:false},
          \     'yapf': {'enabled': v:false},
          \   }
          \ }}
          \ }
  augroup END

  function! s:config_lsp()
      nmap <buffer> gd <Plug>(lsp-definition)
      nmap <buffer> K <Plug>(lsp-hover)
      setlocal omnifunc=lsp#complete
  endfunction
endif "}}}

" vim-lsp-settings {{{
let g:lsp_settings_filetype_python = ['pyls', 'pyls-ms', 'pyright-langserver']

let g:lsp_settings_filetype_html = ['html-languageserver', 'tailwindcss-intellisense']
let g:lsp_settings_filetype_css = ['css-languageserver', 'tailwindcss-intellisense']
let g:lsp_settings_filetype_scss = ['css-languageserver', 'tailwindcss-intellisense']
let g:lsp_settings_filetype_less = ['css-languageserver', 'tailwindcss-intellisense']
" }}}

" vim-mark {{{
if s:is_installed('vim-mark')
  let g:mw_no_mappings = 1
  nmap <Space>m <Plug>MarkSet
  vmap <Space>m <Plug>MarkSet
  nmap <Space>M <Plug>MarkAllClear
endif " }}}

" vim-markdown {{{
if s:is_installed('vim-markdown')
  let g:vim_markdown_autowrite = 0
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_frontmatter = 1

  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1

  " disable gx remapping
  nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
endif " }}}

" vim-matchup {{{
if s:is_installed('vim-matchup')
  let g:matchup_matchparen_status_offscreen = 0
endif " }}}

" vim-nearest-g {{{
if s:is_installed('vim-nearest-g')
  nmap gl <Plug>(nearest-g:neighbor)
endif "}}}

" vim-operator-replace {{{
if s:is_installed('vim-operator-replace')
  " keymap
  map _ <Plug>(operator-replace)
endif " }}}

" vim-quickrun {{{
if s:is_installed('vim-quickrun')
  " async run
  let g:quickrun_config={
        \ '_': {
        \       'runner': 'job',
        \       'hook/output_encode/encoding': '&termencoding',
        \ },
        \ 'asciidoc': {
        \       'command': 'asciidoctor',
        \       'cmdopt': '-r asciidoctor-pdf-cjk -r asciidoctor-diagram',
        \ },
        \ 'c': {
        \       'cmdopt': '-std=c11',
        \ },
        \ 'cpp': {
        \       'cmdopt': '-std=c++17',
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

" vim-racer {{{
if s:is_installed('vim-racer')
  augroup vim_racer_rc
    autocmd!
    autocmd FileType rust nmap gd <Plug>(rust-def)
    autocmd FileType rust nmap K <Plug>(rust-doc)
  augroup END
endif "}}}

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

" vim-sandwich {{{
if s:is_installed('vim-sandwich')
  let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
  let g:sandwich#recipes += [{'buns' : ['「', '」']}]
  let g:sandwich#recipes += [{'buns' : ['『', '』']}]
  let g:sandwich#recipes += [{'buns' : ['【', '】']}]
  let g:sandwich#recipes += [{'buns' : ['（', '）']}]
  let g:sandwich#recipes += [{'buns' : ['〈', '〉']}]
  let g:sandwich#recipes += [{'buns' : ['‘', '’']}]
  let g:sandwich#recipes += [{'buns' : ['“', '”']}]
endif " }}}

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

" vim-test {{{
if s:is_installed('vim-test')
  function! s:background_vimterminal(cmd)
    silent call test#strategy#vimterminal(a:cmd)
    wincmd p
  endfunction
  let g:test#custom_strategies = {'background-vimterminal': function('s:background_vimterminal')}

  let test#strategy = 'vimterminal'

endif " }}}

" vimtex {{{
if s:is_installed('vimtex')
  let g:vimtex_imaps_enabled=0
  let g:vimtex_motion_matchparen = 0
  let g:vimtex_compiler_latexmk = {
        \ 'backends': 'jobs',
        \ 'options' : [
        \   '-gg',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \ }
    let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-pdfdvi',
        \ 'pdflatex'         : '-pdf',
        \ 'dvipdfex'         : '-pdfdvi',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

  if executable('SumatraPDF')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n --remote-silent +\%l \"\%f\"" -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
  else
    let g:vimtex_view_enabled = 0
  endif
endif "}}}

" vimwiki {{{
if s:is_installed('vimwiki')
  let g:vimwiki_autowriteall = 0
  let g:vimwiki_ext2syntax = {'.vmd': 'markdown',}
  let g:vimwiki_folding = 'custom'
  let g:vimwiki_hl_headers = 1
  let g:vimwiki_list_ignore_newline = 0
  let g:vimwiki_text_ignore_newline = 0
  let g:vimwiki_list = [
        \ {
        \   'path': s:share_dir . '/.vim/vimwiki/default/',
        \   'path_html': s:share_dir . '/.vim/vimwiki/default_html/',
        \   'syntax': 'markdown',
        \   'ext': '.vmd',
        \   'auto_tags': 1,
        \ },
        \ {
        \   'path': s:share_dir . '/.vim/vimwiki/private/',
        \   'path_html': s:share_dir . '/.vim/vimwiki/private_html/',
        \   'syntax': 'markdown',
        \   'ext': '.vmd',
        \   'auto_tags': 1,
        \ },
        \ ]
endif "}}}

" vista.vim {{{
if s:is_installed('vista.vim')
  let g:vista_sidebar_position = 'vertical topleft'
  let g:vista_icon_indent = ['\- ', '|- ']
  let g:vista_fold_toggle_icons = ['+', '-']
  let g:vista#renderer#enable_icon = 0

  let g:vista_executive_for = {
        \ 'c': 'vim_lsp',
        \ 'cpp': 'vim_lsp',
        \ 'go': 'vim_lsp',
        \ 'javascript': 'vim_lsp',
        \ 'typescript': 'vim_lsp',
        \ }
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
  autocmd Filetype go if exists(':GoPlay') | delcommand GoPlay | endif
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
  " vimwiki
  autocmd FileType vimwiki setlocal shiftwidth=2 softtabstop=2 foldmethod=marker foldmarker=%%{{{,%%}}}
  autocmd FileType vimwiki hi VimwikiDelText gui=strikethrough
augroup END
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
