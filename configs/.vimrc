" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.vim/plugged')

" ==============================================================
" searching
" ==============================================================
Plug 'rking/ag.vim'

" ==============================================================
" movement
" ==============================================================
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
Plug 'vim-utils/vim-vertical-move'
Plug 'christoomey/vim-tmux-navigator'


" ==============================================================
" tags
" ==============================================================
Plug 'brookhong/cscope.vim'

" ==============================================================
" themes
" ==============================================================
Plug 'jacoborus/tender.vim'
Plug 'tomasr/molokai'

" ==============================================================
" improve use/readability/formatting
" ==============================================================
Plug 'Raimondi/delimitMate'
"Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'
Plug 'preservim/nerdcommenter'
let g:NERDCompactSexyComs = 0
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/vim-auto-save'

" ==============================================================
" handy mappings
" ==============================================================
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-submode'
if has('nvim')
    "Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    ""Plug 'deoplete-plugins/deoplete-clang'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'svermeulen/vim-yoink'
    "Plug 'rbgrouleff/bclose.vim'
else
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1

" ==============================================================
" tools
" ==============================================================
Plug 'francoiscabrol/ranger.vim'
Plug 'kablamo/vim-git-log'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'bsdelf/bufferhint'
    nnoremap - :call bufferhint#Popup()<CR>
    nnoremap \ :call bufferhint#LoadPrevious()<CR>

" ==============================================================
" status line
" ==============================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ==============================================================
" build tools
" ==============================================================
Plug 'neomake/neomake'

" ==============================================================
" Syntax highlighting
" ==============================================================
Plug 'bfrg/vim-cpp-modern'
Plug 'digitaltoad/vim-pug'
Plug 'kchmck/vim-coffee-script'
Plug 'kergoth/vim-bitbake'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'posva/vim-vue'

" ==============================================================
" completion
" ==============================================================
"Plug 'Valloric/YouCompleteMe', { 'tag': '9448748e804a01561f814be49c0b449a9332de1b', 'do': './install.py' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'ycm-core/youcompleteme', { 'do': 'TERM=xterm ./install.py --clangd-completer' }
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

" ==============================================================
" fuzzy file finder
" ==============================================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" Initialize plugin system
call plug#end()

syntax on

set path+=**

" ==============================================================
" sets
" ==============================================================
"set clipboard=unnamed
set clipboard+=unnamedplus
set hidden
set autoindent
set smartindent
set backspace=indent,eol,start
set ignorecase
set showcmd
set incsearch
set scrolloff=8
set invnumber
set invrelativenumber
set number
set nowrap
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
let mapleader=" "

"" CtrlP
"let g:ctrlp_cmd = 'CtrlPMRU'
"nnoremap <leader>vp  :vsp<CR>:CtrlP<CR>
"nnoremap <leader>hp  :sp<CR>:CtrlP<CR>
nnoremap <leader>tb :TagbarToggle<CR>
"nnoremap <leader>gt :!gentags<cr><cr>

"set tags=./tags,tags;
" Y
nnoremap Y v$hy

" Shift
" vnoremap > >gv
" vnoremap < <gv
" nnoremap > >>
" nnoremap < <<
"
" Ag
vnoremap <leader>ag "hy:Ag! <C-r>h<CR>
vnoremap <leader>as "hy:Ag! "struct <C-r>h {"<CR>


" Serach/Replace
vnoremap <leader>r "hy:%Subvert?<C-r>h??gc<left><left><left>

nnoremap <leader>r :Ranger<CR>

nnoremap <leader>s :Subvert//g<left><left>
vnoremap <leader>s :Subvert//g<left><left>

" Edit/Source vimrc
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :w<CR>:source $MYVIMRC<cr>

" Remap default commands mode change commands
"nnoremap <space> :

" JKLH Navigation
nnoremap <Down> <C-W><C-J>
nnoremap <UP> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

"inoremap <C-j> <c-o>gj
"inoremap <C-j> <c-o>gj
"inoremap <C-k> <c-o>gk
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>


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
nnoremap <leader>t<SPACE> :Tab / /l0<CR>
nnoremap <leader>t :Tab //l0<left><left><left>
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
"autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab


nnoremap <leader>{ A<space>{<CR>}<esc>O

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

nnoremap [ic :set noignorecase<cr>
nnoremap ]ic :set ignorecase<cr>
nnoremap yic :set ignorecase!<cr>

nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
"nnoremap <leader>K :bl<cr>
"nnoremap <leader>J :bf<cr>

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

nmap <Leader>gn :GundoToggle<CR>


map z <Plug>Sneak_s
map Z <Plug>Sneak_S
"noremap f <Plug>Sneak_f
"noremap F <Plug>Sneak_F
"noremap t <plug>sneak_t
"noremap T <plug>sneak_T
"let g:sneak#label = 1
runtime macros/matchit.vim


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"
" Shortcuts for switching between files in angular
"
":nnoremap <leader>eh :e %:p:r.html<cr>
":nnoremap <leader>et :e %:p:r.ts<cr>
":nnoremap <leader>ec :e %:p:r.scss<cr>

""-- FOLDING --
"set foldmethod=syntax "syntax highlighting items specify folds
""set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by js syntax
"set foldlevelstart=1 "start file with all folds opened
"
"set foldmethod=indent
"set foldlevel=3
"set foldclose=all
"set wildignore+=**/node_modules/**

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
    let commands = ['History', 'Files', 'Buffers']
    execute commands[a:idx]
    let next = (a:idx + 1) % len(commands)
    let previous = (a:idx - 1) % len(commands)
    execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.next.')<cr>'
    execute 'tnoremap <buffer> <silent> <c-b> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.previous.')<cr>'
endfunction

command! Cycle call <sid>fzf_next(0)
nnoremap <c-p> :Cycle<CR>
"nnoremap <c-f> :Files<CR>
"nnoremap <c-b> :Buffers<CR>

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


" edit q macro
noremap <leader>eq :let @q='<C-R><C-R>q'

function MakeRailImage(platform)
    execute 'wa'
    execute 'cd /home/will/dev-projects/tablesafe/rail-reve/rail-linux-4.x/linux-4.9.46'
    execute 'make tablesafe_defconfig'
	execute '!rm arch/arm/boot/dts/*.dtb'
	execute 'make tablesafe-rail_A' . a:platform . '.dtb'
	execute 'make -j12'
endfunction

nnoremap <leader>0 :call MakeRailImage("10")<CR>
nnoremap <leader>1 :call MakeRailImage("11")<CR>


" make sonsosite
"noremap <leader>m :cd /home/will/dev-projects/mturbo-linux-port<CR>:make -j4<cr>
"noremap <leader>z :cd /home/will/dev-projects/tablesafe/rail-reve/rail-linux-4.x/linux-4.9.46<CR>:make tablesafe_defconfig<CR>:make -j12<CR>
"noremap <leader>10 :cd /home/will/dev-projects/tablesafe/rail-reve/rail-linux-4.x/linux-4.9.46<CR>:!rm arch/arm/boot/dts/*.dtb<CR>:make tablesafe-rail_A10.dtb<CR>
"noremap <leader>11 :cd /home/will/dev-projects/tablesafe/rail-reve/rail-linux-4.x/linux-4.9.46<CR>:!rm arch/arm/boot/dts/*.dtb<CR>:make tablesafe-rail_A11.dtb<CR>

" ?
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:ranger_map_keys = 0

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
:set cscopequickfix=""

" deoplete variables
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so.8'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/8.0.1/include/'
let g:deoplete#sources#clang#clang_complete_database = '/home/will/dev-projects/mturbo-linux-port'

call neomake#configure#automake('w')

" enable mouse support
:set mouse=a

" move vertiacally
nmap } ]v
xmap } ]v

" ==============================================================
" csope mappings
" ==============================================================
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


" ==============================================================
" For debugging drivers
" ==============================================================
nnoremap <leader>dbk :%s/^{$/{ printk("dbg: %s (%d) %s(...)\\n", __FILE__, __LINE__, __func__);/g
nnoremap <leader>dbf :%s/^{$/{ printf("dbg: %s (%d) %s(...)\\n", __FILE__, __LINE__, __func__);/g
nnoremap <leader>pk oprintk("dbg: %s (%d) %s\n", __FILE__, __LINE__, __func__);<esc>
nnoremap <leader>pK Oprintk("dbg: %s (%d) %s\n", __FILE__, __LINE__, __func__);<esc>

vnoremap <leader>pks yoprintk("dbg: %s:(%d) =%s\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pks yOprintk("dbg: %s:(%d) =%s\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>pkd yoprintk("dbg: %s:(%d) =%d\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pkd yOprintk("dbg: %s:(%d) =%d\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>pkx yoprintk("dbg: %s:(%d) =0x%x\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pkx yOprintk("dbg: %s:(%d) =0x%x\n", __func__, __LINE__, );<esc>4BP$BP

nnoremap <leader>pf oprintf("dbg: %s (%d) %s\n", __FILE__, __LINE__, __func__);<esc>
nnoremap <leader>pF Oprintf("dbg: %s (%d) %s\n", __FILE__, __LINE__, __func__);<esc>
vnoremap <leader>pfs yoprintf("dbg: %s:(%d) =%s\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pfs yOprintf("dbg: %s:(%d) =%s\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>pfd yoprintf("dbg: %s:(%d) =%d\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pfd yOprintf("dbg: %s:(%d) =%d\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>pfx yoprintf("dbg: %s:(%d) =0x%x\n", __func__, __LINE__, );<esc>4BP$BP
vnoremap <leader>Pfx yOprintf("dbg: %s:(%d) =0x%x\n", __func__, __LINE__, );<esc>4BP$BP
nnoremap <leader>dbd :%s/\s*print[kf]("dbg:.*//g


" Shortcuts
nnoremap <leader>pj oconsole.log("");<esc>bla
vnoremap <leader>pj yoconsole.log(JSON.stringify(, null, 2))<esc>F(;a"", <esc>2hPf(p

" submode
call submode#enter_with('tab-nav', 'n', '', '<leader>j', ':bp<cr>')
call submode#enter_with('tab-nav', 'n', '', '<leader>k', ':bn<cr>')
call submode#map('tab-nav', 'n', '', 'j', ':bp<cr>')
call submode#map('tab-nav', 'n', '', 'k', ':bn<cr>')
"disable submode timeouts:
let g:submode_timeout = 0
" don't consume submode-leaving key
let g:submode_keep_leaving_key = 1

set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.h :setlocal filetype=c
autocmd FileType c,dts setlocal noexpandtab

"---------------------------------------
" vim-gitgutter
"---------------------------------------
nmap <leader>gr <Plug>(GitGutterUndoHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>xp <Plug>(GitGutterPreviewHunk)
nmap <leader>xs <Plug>(GitGutterStageHunk)


"enter without going into insert mode
nnoremap <Enter> o<esc>
