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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'peterhoeg/vim-qml'
"Plug 'Valloric/YouCompleteMe', { 'tag': '9448748e804a01561f814be49c0b449a9332de1b', 'do': './install.py' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'chazy/cscope_maps'
Plug 'vim-scripts/a.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'mtth/scratch.vim'
Plug 'kablamo/vim-git-log'
Plug 'digitaltoad/vim-pug'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'burnettk/vim-angular'
Plug 'leafgarland/typescript-vim'
Plug 'justinmk/vim-sneak'
Plug 'jacoborus/tender.vim'
Plug 'mattn/emmet-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

syntax on

"---------------------------------------
" Sets
"---------------------------------------
set clipboard=unnamedplus
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
set diffopt+=iwhite
set invnumber
set invrelativenumber
set number
set ambiwidth=double
set nowrap
set autochdir
set t_ut=
set noswapfile

" No more ex mode
noremap q: <Nop>
nnoremap Q <nop>

"Save a file after having opened it
cnoremap w!! w !sudo tee % >/dev/null

"" Save all buffers
":nnoremap sa :wa<CR>

" Leader
let mapleader=","

" Enter
nnoremap M  o<esc>k
nnoremap L  O<esc>j

"" CtrlP
"let g:ctrlp_cmd = 'CtrlPMRU'
"nnoremap <leader>vp  :vsp<CR>:CtrlP<CR>
"nnoremap <leader>hp  :sp<CR>:CtrlP<CR>
"nnoremap <leader>tb :TagbarToggle<CR>
"nnoremap <leader>gt :!gentags<cr><cr>

" Y
nnoremap Y v$hy

" Shift
" vnoremap > >gv
" vnoremap < <gv
" nnoremap > >>
" nnoremap < <<

" Serach/Replace
vnoremap <leader>ra "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>raf "hy:%s?\V<C-r>h??g<left><left>
vnoremap <leader>rA "hy:bufdo %s?\V<C-r>h??gc<left><left><left>
vnoremap <leader>rAf "hy:bufdo %s?\V<C-r>h??g<left><left>

" Edit/Source vimrc
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :w<CR>:source $MYVIMRC<cr>

" show line number
:nnoremap <leader>nu :set invnumber<CR>
:nnoremap <leader>nr :set invrelativenumber<CR>

" Remap default commands mode change commands
nnoremap <space> :

" JKLH Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make cw consistent with dw, yw, vw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

" smash escape
inoremap jk <esc>
cnoremap jk <esc>
vnoremap v <esc>

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
nnoremap <leader>fw :FixWhitespace<CR>gg=G''

"---------------------------------------
" NERDTree
"---------------------------------------
nnoremap <leader>nt :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1

function! MaybeFiles()
    :if argc() == 0
    :    History
    :endif
endfunction
au VimEnter * call MaybeFiles()

let g:NERDTreeWinSize=40

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
let g:airline_theme='tender'
let g:airline_powerline_fonts = 1
set guifont=Sauce_Code_Powerline:h9:cANSI
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

"---------------------------------------
" Fugitive
"---------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost *log* cwindow

"---------------------------------------
" Easy Motion
"---------------------------------------
"map <Leader> <Plug>(easymotion-prefix)
"nmap <Leader>s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

"---------------------------------------
" YouCompleteMe
"---------------------------------------
"let g:ycm_show_diagnostics_ui = 1

"---------------------------------------
" Ctags
"---------------------------------------
set tags+=/media/sf_share/dev/tags

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
" Cscope
"---------------------------------------
"cs add $CSCOPE_DB
"function! LoadCscope()
"  let db = findfile("cscope.out", ".;")
"  if (!empty(db))
"    let path = strpart(db, 0, match(db, "/cscope.out$"))
"    set nocscopeverbose " suppress 'duplicate connection' error
"    exe "cs add " . db . " " . path
"    set cscopeverbose
"  endif
"endfunction
"au BufEnter /* call LoadCscope()

"---------------------------------------
" EasyClip
"---------------------------------------
let g:EasyClipAutoFormat = 1

"---------------------------------------
" Color
"---------------------------------------
"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme tender

"---------------------------------------
" Ultislips
"---------------------------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

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



let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-w>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_skip_key='<C-r>'
let g:multi_cursor_quit_key='<Esc>'





" Shortcuts
nnoremap <leader>l oconsole.log(JSON.stringify(, null, 2))<esc>2Bba
vnoremap <leader>l yoconsole.log(JSON.stringify(, null, 2))<esc>F(;a"", <esc>2hPf(p
vnoremap <leader>a yoalert(JSON.stringify(, null, 2))<esc>F(p

nnoremap <leader>{ A<space>{<CR>}<esc>O
"nnoremap <leader>f Afunction(status, response)<space>{<CR>});<esc>O

nnoremap <leader>df da{2dd

:nnoremap <leader>ss r[a"<esc>ea"]<esc>

nnoremap <leader>tic :set ignorecase!<cr>
nnoremap <leader>k :bn<cr>
nnoremap <leader>j :bp<cr>
nnoremap <f5> :!runAthena<cr><cr>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

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
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Files ~/devprojects<cr>

nnoremap <leader>fr :History<cr>
nnoremap <leader>fh :Files<cr>
nnoremap <leader>ft :Files<space>
nnoremap <leader>fs :Files ~/devprojects/phoenix-data-service<cr>
nnoremap <leader>fp :Files ~/devprojects/phoenix<cr>



"
" Shortcuts for switching between files in angular
"
:nnoremap <leader>eh :e %:p:r.html<cr>
:nnoremap <leader>et :e %:p:r.ts<cr>
:nnoremap <leader>ec :e %:p:r.scss<cr>

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
"set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by js syntax
set foldlevelstart=1 "start file with all folds opened

