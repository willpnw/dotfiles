" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

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
"Plug 'chazy/cscope_maps'
Plug 'vim-scripts/a.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-eunuch'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'mtth/scratch.vim'
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
Plug 'ludovicchabant/vim-gutentags'
"Plug 'vim-scripts/vim-auto-save'
"Plug 'sickill/vim-pasta'
"Plug 'takac/vim-hardtime'
"Plug 'vimwiki/vimwiki'

if has('nvim')
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'svermeulen/vim-yoink'
else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

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
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set ignorecase
set showcmd
set incsearch
set expandtab
set scrolloff=8
"set diffopt+=iwhite
set invnumber
set invrelativenumber
set number
set ambiwidth=double
set nowrap
"set autochdir
set t_ut=
set noswapfile
set nomodeline
set nocscopeverbose

" No more ex mode
noremap q: <Nop>
nnoremap Q <nop>

"Save a file after having opened it
cnoremap w!! w !sudo tee % >/dev/null

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

" Serach/Replace
vnoremap <leader>ra "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>rA "hy:%s?\V<C-r>h??g<left><left>
vnoremap <leader>ri "hy:bufdo %Subvert?\V<C-r>h??gc<left><left><left>
vnoremap <leader>rIf "hy:bufdo %Subvert?\V<C-r>h??g<left><left>

" Edit/Source vimrc
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :w<CR>:source $MYVIMRC<cr>

" Remap default commands mode change commands
nnoremap <space> :

" JKLH Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
nnoremap <leader>nt :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1

function! MaybeFiles()
    :if argc() == 0
    :    Cycle
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
vnoremap <leader>a yoalert(JSON.stringify(, null, 2))<esc>F(p

nnoremap <leader>{ A<space>{<CR>}<esc>O
"nnoremap <leader>f Afunction(status, response)<space>{<CR>});<esc>O

nnoremap <leader>df da{2dd

:nnoremap <leader>ss r[a"<esc>ea"]<esc>

nnoremap ]ic :set noignorecase<cr>
nnoremap [ic :set ignorecase<cr>
nnoremap yic :set ignorecase!<cr>

nnoremap <leader>k :bn<cr>
nnoremap <leader>j :bp<cr>
nnoremap <f5> :!runAthena<cr><cr>

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
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

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
nnoremap <c-p> :Files ~/dev-projects/sonosite-x-porte-app/<CR>

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

"nmap <c-n> <plug>(YoinkPostPasteSwapBack)
"nmap <c-m> <plug>(YoinkPostPasteSwapForward)

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



function! s:fzf_next(idx)
    let commands = ['Files ~/dev-projects/sonosite-x-porte-app/', 'History', 'Buffers']
    execute commands[a:idx]
    let next = (a:idx + 1) % len(commands)
    let previous = (a:idx - 1) % len(commands)
    execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.next.')<cr>'
    execute 'tnoremap <buffer> <silent> <c-b> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.previous.')<cr>'
endfunction

command! Cycle call <sid>fzf_next(0)
nnoremap <c-p> :Cycle<CR>

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
