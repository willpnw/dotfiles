" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.vim/plugged')
"
"
let g:ycm_show_diagnostics_ui=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_echo_current_diagnostic=0
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_confirm_extra_conf=0
let g:ycm_auto_trigger=1
let g:ycm_keep_logfiles=0
let g:ycm_cache_omnifunc=1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 1
"let g:ycm_clangd_args = ['--background-index', '--all-scopes-completion', '--suggest-missing-includes']

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

"My Bundles here:
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'godlygeek/tabular'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'peterhoeg/vim-qml'
"Plug 'Valloric/YouCompleteMe', { 'tag': '9448748e804a01561f814be49c0b449a9332de1b', 'do': './install.py' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ycm-core/youcompleteme', { 'do': 'TERM=xterm ./install.py --clangd-completer' }
"Plug 'chazy/cscope_maps'
Plug 'vim-scripts/a.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-eunuch'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'kablamo/vim-git-log'
Plug 'digitaltoad/vim-pug'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'justinmk/vim-sneak'
Plug 'jacoborus/tender.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/vim-auto-save'
"Plug 'sickill/vim-pasta'
"Plug 'takac/vim-hardtime'
"Plug 'vimwiki/vimwiki'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'francoiscabrol/ranger.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-utils/vim-vertical-move'
Plug 'psliwka/vim-smoothie'
Plug 'brookhong/cscope.vim'
Plug 'kergoth/vim-bitbake'
Plug 'Yggdroot/indentLine'


if has('nvim')
    "Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    ""Plug 'deoplete-plugins/deoplete-clang'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'svermeulen/vim-yoink'
    Plug 'rbgrouleff/bclose.vim'
else
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

syntax on

set path+=**

"---------------------------------------
" Sets
"---------------------------------------
"set clipboard=unnamed
set clipboard+=unnamedplus
set hidden
set autoindent
set smartindent
"set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set ignorecase
set showcmd
set incsearch
"set expandtab
set noexpandtab
set scrolloff=8
"set diffopt+=iwhite
set invnumber
set invrelativenumber
set number
"set ambiwidth=double
set nowrap
"set autochdir
set t_ut=
set noswapfile
set nomodeline
set nocscopeverbose
set completeopt-=preview

" No more ex mode
noremap q: <Nop>
nnoremap Q <nop>

"Save a file after having opened it
"cnoremap w!! w !sudo tee % >/dev/null

"" Save all buffers
":nnoremap sa :wa<CR>

" Leader
let mapleader=","

"" CtrlP
"let g:ctrlp_cmd = 'CtrlPMRU'
"nnoremap <leader>vp  :vsp<CR>:CtrlP<CR>
"nnoremap <leader>hp  :sp<CR>:CtrlP<CR>
nnoremap <leader>tb :TagbarToggle<CR>
"nnoremap <leader>gt :!gentags<cr><cr>

set tags=./tags,tags;
" Y
nnoremap Y v$hy

" Shift
" vnoremap > >gv
" vnoremap < <gv
" nnoremap > >>
" nnoremap < <<
"
" Ag
vnoremap <leader>a "hy:Ag <C-r>h<CR>

" Serach/Replace
vnoremap <leader>r "hy:%Subvert?<C-r>h??gc<left><left><left>

nnoremap <leader>r :Ranger<CR>

nnoremap <leader>s :Subvert//g<left><left>
vnoremap <leader>s :Subvert//g<left><left>

" Edit/Source vimrc
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :w<CR>:source $MYVIMRC<cr>

" Remap default commands mode change commands
nnoremap <space> :

" JKLH Navigation
nnoremap <Down> <C-W><C-J>
nnoremap <UP> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

inoremap <C-j> <c-o>gj
inoremap <C-j> <c-o>gj
inoremap <C-k> <c-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>


" Make cw consistent with dw, yw, vw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

" Midscreen serch results
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz


"---------------------------------------
" rainbow_parentheses
"---------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
            \ ['brown',   'RoyalBlue3'],
            \ ['blue',    'SeaGreen3'],
            \ ['gray',    'Orchid3'],
            \ ['green',   'firebrick3'],
            \ ['cyan',    'RoyalBlue3'],
            \ ['red',     'SeaGreen3'],
            \ ['magenta', 'Orchid3'],
            \ ['brown',   'firebrick3'],
            \ ['gray',    'RoyalBlue3'],
            \ ['green',   'SeaGreen3'],
            \ ['magenta', 'Orchid3'],
            \ ['blue',    'firebrick3'],
            \ ['green',   'RoyalBlue3'],
            \ ['cyan',    'SeaGreen3'],
            \ ['red',     'Orchid3'],
            \ ['white',     'firebrick3'],
            \ ]
"---------------------------------------
" FixWhiteSpace
"---------------------------------------
nnoremap <leader>f :FixWhitespace<CR>gg=G''

"---------------------------------------
" NERDTree
"---------------------------------------
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1

function! MaybeFiles()
    :if argc() == 0
    :    call <sid>fzf_next(0)
    :endif
endfunction
au VimEnter * call MaybeFiles()

let g:NERDTreeWinSize=30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"---------------------------------------
" Tabular
"---------------------------------------
nnoremap <leader>t :Tab /
nnoremap <leader>t: :Tab /:<CR>
nnoremap <leader>t, :Tab /,\zs/l0c1<CR>
nnoremap <leader>t( :Tab /(/l0c0<CR>
nnoremap <leader>t= :Tab /\(=\)\@<!=\([>=]\)\@!<CR>

"---------------------------------------
" Airline
"---------------------------------------
"let g:airline_theme='tender'
let g:airline_powerline_fonts = 1
set guifont=Sauce_Code_Powerline:h9:cANSI
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Gstatus<CR><C-w>15-
nnoremap <leader>gb :Gblame<CR>

"---------------------------------------
" Fugitive
"---------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost *log* cwindow

"---------------------------------------
" YouCompleteMe
"---------------------------------------
"let g:ycm_show_diagnostics_ui = 1

"---------------------------------------
" Ctags
"---------------------------------------
"nnoremap <C-g> <C-]>
"---------------------------------------
" a.vim
"---------------------------------------
nnoremap <C-c> :A<CR>

"---------------------------------------
" Ack
"---------------------------------------
nnoremap ack :Ack! -Qi ""<left>
vnoremap ack "hy:Ack! -Qi "<C-r>h"

"---------------------------------------
" Color
"---------------------------------------
"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme tender

"---------------------------------------
" vim-indent-guides
"---------------------------------------
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=42


"---------------------------------------
" vim-coffee-script
"---------------------------------------
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Shortcuts
nnoremap <leader>l oconsole.log(JSON.stringify(, null, 2))<esc>2Bba
vnoremap <leader>l yoconsole.log(JSON.stringify(, null, 2))<esc>F(;a"", <esc>2hPf(p

nnoremap <leader>{ A<space>{<CR>}<esc>O
"nnoremap <leader>f Afunction(status, response)<space>{<CR>});<esc>O

nnoremap [ic :set noignorecase<cr>
nnoremap ]ic :set ignorecase<cr>
nnoremap yic :set ignorecase!<cr>

nnoremap <leader>k :bn<cr>
nnoremap <leader>j :bp<cr>
nnoremap <leader>K :bl<cr>
nnoremap <leader>J :bf<cr>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
let g:closetag_close_shortcut = '<leader>>'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.phtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
"---------------------------------------
" vim-gitgutter
"---------------------------------------
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)

nmap <Leader>gn :GundoToggle<CR>


map s <Plug>Sneak_s
map S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
let g:sneak#label = 1
runtime macros/matchit.vim


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
" Shortcuts for switching between files in angular
"
:nnoremap <leader>eh :e %:p:r.html<cr>
:nnoremap <leader>et :e %:p:r.ts<cr>
:nnoremap <leader>ec :e %:p:r.scss<cr>

""-- FOLDING --
"set foldmethod=syntax "syntax highlighting items specify folds
""set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by js syntax
"set foldlevelstart=1 "start file with all folds opened
"
set wildignore+=**/node_modules/**

let g:yoinkIncludeDeleteOperations = 1

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-m> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)



" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <leader><space> :ZoomToggle<CR>

let g:auto_save = 1


let g:hardtime_default_on = 1

nnoremap <leader>q :q<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>w :wa<CR>
au BufRead,BufNewFile *.xaml setfiletype xml


filetype plugin indent on



function! s:fzf_next(idx)
    "let commands = ['Files ~/dev-projects/sonosite/yocto/build/workspace/sources/controlio-turbo', 'History', 'Buffers']
    let commands = ['History', 'Files ~/dev-projects/tablesafe/rail-reve/rail-linux-4.x/linux-4.9.46', 'Buffers']
    execute commands[a:idx]
    let next = (a:idx + 1) % len(commands)
    let previous = (a:idx - 1) % len(commands)
    execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.next.')<cr>'
    execute 'tnoremap <buffer> <silent> <c-b> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.previous.')<cr>'
endfunction

command! Cycle call <sid>fzf_next(0)
nnoremap <c-p> :Cycle<CR>
nnoremap <leader>b :Buffers<CR>

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    "set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    " cscope maps
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    nnoremap <C-g>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-g>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-g>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-g>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-g>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <C-g>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nnoremap <C-g>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif



noremap <leader>eq :let @q='<C-R><C-R>q'
noremap <leader>m :cd /home/will/dev-projects/mturbo-linux-port<CR>:make -j4<cr>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:ranger_map_keys = 0

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
:set cscopequickfix=""

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so.8'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/8.0.1/include/'
let g:deoplete#sources#clang#clang_complete_database = '/home/will/dev-projects/mturbo-linux-port'

call neomake#configure#automake('w')

"let g:indent_guides_enable_on_vim_startup = 1


:set mouse=a


nmap } ]v
xmap } ]v







nnoremap <leader>sa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>sl :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>ss :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>sg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>sd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>sc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>st :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>se :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>sf :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>si :call CscopeFind('i', expand('<cword>'))<CR>




" For debugging drivers
nnoremap  <leader>dbg :%s/^{$/{ printk("dbg: %s (%d) %s(...)\\n", __FILE__, __LINE__, __func__);/g
nnoremap <leader>p oprintk("dbg: %s (%d) %s\n", __FILE__, __LINE__, __func__);<esc>
vnoremap <leader>p yoprintk("dbg: %s (%d) %s:  - (0x%0x)\n", __FILE__, __LINE__, __func__, );<esc>6BhP$BP



let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [ '*.git', '*.svn', '*.hg', 'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components', '*-lock.json',  '*.lock', '*.min.*', '*.bak', '*.zip', '*.pyc', '*.class', '*.sln', '*.csproj', '*.csproj.user', '*.tmp', '*.cache', '*.vscode', '*.pdb', '*.exe', '*.dll', '*.bin', '*.mp3', '*.ogg', '*.flac', '*.swp', '*.swo', '.DS_Store', '*.plist', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg', '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls']



