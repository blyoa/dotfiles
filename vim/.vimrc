if !1 | finish | endif

" flags {{{
let s:is_windows=has('win16') || has('win32') || has('win64')
let s:is_cygwin=has('win32unix')
" }}}


" variables {{{
let s:share_dir='~/Dropbox/share_for_me'
let s:vimfiles='~/.vim'
" for portable use
"let s:vimfiles=$VIM/.vim
"
" }}}


" initialization {{{
" language
language C
set langmenu=none

if has('vim_starting')
    let &runtimepath.=',' . s:vimfiles . '/bundle/neobundle.vim/'
endif

" load neobundle {{{
call neobundle#begin(expand(s:vimfiles . '/bundle/'))

if neobundle#has_fresh_cache()
    NeoBundleLoadCache
else
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundleLazy 'Shougo/junkfile.vim', {
                \ 'commands': ['JunkfileOpen'],
                \ 'unite_sources': 'junkfile',
                \ }
    NeoBundleLazy 'Shougo/neomru.vim', {
                \ 'filetypes': 'all',
                \ 'unite_sources': ['neomru/file', 'neomru/directory'],
                \ }
    NeoBundleLazy 'Shougo/neosnippet.vim', {
                \ 'filetypes': 'snippet',
                \ 'insert': 1,
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
                \ 'commands': [
                \     {'name': 'Unite',
                \      'complete': 'customlist,unite#complete_source'},
                \     'UniteWithCursorWord', 'UniteWithInput'],
                \ }
    NeoBundleLazy 'Shougo/unite-help', {
                \ 'depends': 'Shougo/unite.vim',
                \ 'unite_sources': 'help',
                \ }
    NeoBundleLazy 'Shougo/unite-outline', {
                \ 'depends': 'Shougo/unite.vim',
                \ 'unite_sources': 'outline',
                \ }
    NeoBundleLazy 'Shougo/unite-session', {
                \ 'commands': ['UniteSessionSave', 'UniteSessionLoad'],
                \ 'unite_sources': 'settion',
                \ }
    NeoBundleLazy 'osyo-manga/unite-quickfix', {
                \ 'depends': 'Shougo/unite.vim',
                \ 'unite_sources': 'quickfix',
                \ }
    NeoBundleLazy 'ujihisa/unite-colorscheme', {
                \ 'depends': 'Shougo/unite.vim',
                \ 'unite_sources': 'colorscheme',
                \ }
    if has('lua')
        NeoBundleLazy 'Shougo/neocomplete.vim', {
                    \ 'insert': 1,
                    \ }
    else
        NeoBundleLazy 'Shougo/neocomplcache.vim', {
                    \ 'insert': 1,
                    \ }
    endif
    NeoBundleLazy 'Shougo/vimfiler', {
                \ 'commands': [
                \     {'name': 'VimFiler',
                \      'complete': 'customlist,vimfiler#complete'},
                \      'VimFilerExplorer', 'VimFilerTab'],
                \ }
    NeoBundleLazy 'Shougo/vimshell.vim', {
                \ 'commands': ['VimShell', 'VimShellExecute', 'VimShellInteractive',
                \              'VimShellPop'],
                \ }
    NeoBundle 'cohama/vim-hier'
    NeoBundle 'deris/vim-visualinc'
    NeoBundle 'flazz/vim-colorschemes'
    NeoBundleLazy 'glidenote/memolist.vim', {
                \ 'commands': ['MemoNew', 'MemoList', 'MemoGrep'],
                \ }
    NeoBundleLazy 'h1mesuke/vim-alignta', {
                \ 'commands': ['Alignta'],
                \ }
    NeoBundleLazy 'hail2u/vim-css3-syntax', {
                \ 'filetypes': ['css', 'sass', 'scss', 'less'],
                \ }
    NeoBundleLazy 'haya14busa/incsearch.vim', {
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'haya14busa/vim-asterisk', {
                \ 'mappings': '<Plug>(asterisk-',
                \ }
    NeoBundleLazy 'hynek/vim-python-pep8-indent', {
                \ 'filetypes': ['python', 'python3', 'djangohtml'],
                \ 'insert': 1,
                \ }
    NeoBundle 'kana/vim-niceblock'
    NeoBundleLazy 'kana/vim-altr', {
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'kana/vim-operator-user', {
                \ 'functions': 'operator#user#define',
                \ }
    NeoBundleLazy 'kana/vim-operator-replace', {
                \ 'dependes': 'kana/vim-operator-user',
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'rhysd/vim-operator-surround', {
                \ 'depends': 'kana/vim-operator-user',
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'kana/vim-textobj-user'
    NeoBundle 'kana/vim-textobj-indent', {
                \ 'depends': 'kana/vim-textobj-user',
                \ }
    NeoBundleLazy 'thinca/vim-textobj-between', {
                \ 'depends': 'kana/vim-textobj-user',
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'kana/vim-submode', {
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'lilydjwg/colorizer', {
                \ 'filetypes': ['html', 'djangohtml',
                \               'css', 'sass', 'scss', 'less'],
                \ }
    NeoBundleLazy 'mattn/emmet-vim', {
                \ 'filetypes': ['html', 'djangohtml',
                \               'css', 'sass', 'scss', 'less'],
                \ }
    NeoBundleLazy 'othree/html5.vim', {
                \ 'filetypes': ['html', 'djangohtml'],
                \ }
    NeoBundleLazy 'pangloss/vim-javascript', {
                \ 'filetypes': ['html', 'djangohtml', 'javascript'],
                \ }
    NeoBundleLazy 't9md/vim-quickhl', {
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'thinca/vim-qfreplace', {
                \ 'filetypes': ['unite', 'quickfix'],
                \ }
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'thinca/vim-ref'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundleLazy 'tyru/capture.vim', {
                \ 'commands': [
                \     {'name': 'Capture',
                \      'complete': 'command'}],
                \ }
    NeoBundleLazy 'tyru/caw.vim', {
                \ 'mappings': '<Plug>',
                \ }
    NeoBundleLazy 'tyru/open-browser.vim', {
                \ 'mappings': '<Plug>(openbrowser-',
                \ }
    NeoBundleLazy 'kannokanno/previm', {
                \ 'depends': 'tyru/open-browser.vim',
                \ 'filetypes': ['markdown', 'mkd', 'rst'],
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
set listchars=extends:>,precedes:<,trail:_

" statusline
set laststatus=2
let &statusline="%{expand('%:p:.')}\ %w%r\%m"
            \ . "\ %=%y%{'['.(&fenc!=''?&fenc:&enc).(&bomb?'(BOM)':'').','.&ff.']'}"
            \ . "%{printf(' %5d/%d', line('.'), line('$'))}"

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

" misc
set hidden
set backspace=indent,eol,start
set nowildmenu
set wildmode=list:longest,full

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
" caw.vim {{{
if neobundle#tap('caw.vim') 
    " keymap
    nmap <Leader>c <Plug>(caw:I:toggle)
    vmap <Leader>c <Plug>(caw:I:toggle)

    call neobundle#untap()
endif " }}}

" emmet-vim {{{
if neobundle#tap('emmet-vim')
    let g:user_emmet_settings={
                \ 'variables': {
                \     'lang': 'ja',
                \ }}

    call neobundle#untap()
endif " }}}

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

    call neobundle#untap()
endif " }}}

" neocomplete.vim {{{
if neobundle#tap('neocomplete.vim')
    let g:neocomplete#enable_at_startup=1

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

" vim-altr {{{
if neobundle#tap('vim-altr')
    " keymap
    nmap <F2> <Plug>(altr-forward)
    nmap <S-F2> <Plug>(altr-back)

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
                \ }}

    " keymap
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : '\<C-c>'
    call neobundle#untap()
endif " }}}

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
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
augroup END
" }}}

" vim: expandtab softtabstop=4 shiftwidth=4 foldmethod=marker
