" Leader
let mapleader=" "

"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" ==============================================================
" movement
" ==============================================================
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
if has('nvim')
    Plug 'psliwka/vim-smoothie'
endif
Plug 'vim-utils/vim-vertical-move'
nmap } ]v
xmap } ]v

"  mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers
Plug 'kshenoy/vim-signature'

" ==============================================================
" tags
" ==============================================================
Plug 'ludovicchabant/vim-gutentags'
set tags=./tags,tags;

"" ==============================================================
"" themes
"" ==============================================================
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf'
Plug 'jacoborus/tender.vim'
Plug 'sainnhe/everforest'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

let g:molokai_original = 1
let g:rehash256 = 1

" ==============================================================
" improve use/readability/formatting
" ==============================================================
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
autocmd Filetype json let g:indentLine_setConceal = 0
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=42
autocmd BufNewFile,BufRead *.qss   set syntax=css

Plug 'airblade/vim-gitgutter'
nmap <leader>gr <Plug>(GitGutterUndoHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>xp <Plug>(GitGutterPreviewHunk)
nmap <leader>xs <Plug>(GitGutterStageHunk)

Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_ctermcolor='blue'
nnoremap <leader>f :StripWhitespace<CR>gg=G

Plug 'godlygeek/tabular'
nnoremap <leader>t<SPACE> :Tab / /l0<CR>
nnoremap <leader>t :Tab //l1<left><left><left>
nnoremap <leader>t: :Tab /:<CR>
nnoremap <leader>t, :Tab /,\zs/l0c1<CR>
nnoremap <leader>t( :Tab /(/l0c0<CR>
nnoremap <leader>t= :Tab /\(=\)\@<!=\([>=]\)\@!<CR>

Plug 'junegunn/rainbow_parentheses.vim'
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

Plug 'preservim/nerdcommenter'
let g:NERDCompactSexyComs = 0

Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1

" ==============================================================
" handy mappings
" ==============================================================
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
if has('nvim')
    Plug 'svermeulen/vim-yoink'
    let g:yoinkChangeTickThreshold  = 1
    let g:yoinkIncludeDeleteOperations = 1
    nmap <c-n> <plug>(YoinkPostPasteSwapBack)
    nmap <c-m> <plug>(YoinkPostPasteSwapForward)
    nmap p <plug>(YoinkPaste_p)
    nmap P <plug>(YoinkPaste_P)
    nnoremap m d
    xnoremap m d
    nnoremap mm dd
    nnoremap M D
endif

" ==============================================================
" tools
" ==============================================================
Plug 'preservim/tagbar'
nnoremap <leader>tb :TagbarToggle<CR>

Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1

let g:NERDTreeWinSize=30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost *log* cwindow
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Git<CR><C-w>15-
nnoremap <leader>gb :Git blame<CR>

Plug 'vim-scripts/a.vim'
nnoremap <C-c> :A<CR>

Plug 'schickling/vim-bufonly'

" ==============================================================
" status line
" ==============================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
"let g:airline_extensions = [ "tabline" ]
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" ==============================================================
" Syntax highlighting
" ==============================================================
Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'

" ==============================================================
" completion
" ==============================================================
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ==============================================================
" snippets
" ==============================================================
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" ==============================================================
" fuzzy file finder
" ==============================================================
Plug 'junegunn/fzf', { 'tag': '0.20.0', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', {'commit': '76669c3c1d675833f9d89f6496f16a7accc0f40e' }
Plug 'pbogut/fzf-mru.vim'
function! s:fzf_next(idx)
    let commands = ['History', 'Files', 'Buffers']
    execute commands[a:idx]
    let next = (a:idx + 1) % len(commands)
    let previous = (a:idx - 1) % len(commands)
    execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.next.')<cr>'
    execute 'tnoremap <buffer> <silent> <c-b> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.previous.')<cr>'
endfunction
function! MaybeFiles()
    :if argc() == 0
    :    call <sid>fzf_next(0)
    :endif
endfunction
au VimEnter * call MaybeFiles()

command! Cycle call <sid>fzf_next(0)
nnoremap <c-p> :Cycle<CR>
nnoremap <leader>b :Buffers<CR>
vnoremap <leader>a y:Ag <c-r>0<CR>

" Use FZF for tag jumping with the current tag
nnoremap <C-]> ye:Tags<CR>

" Initialize plugin system
call plug#end()

syntax on

set path+=**

" ==============================================================
" sets
" ==============================================================
set clipboard+=unnamedplus
"let g:clipboard = {
"        \   'name': 'win32yank-wsl',
"        \   'copy': {
"        \      '+': 'win32yank.exe -i --crlf',
"        \      '*': 'win32yank.exe -i --crlf',
"        \    },
"        \   'paste': {
"        \      '+': 'win32yank.exe -o --lf',
"        \      '*': 'win32yank.exe -o --lf',
"        \   },
"        \   'cache_enabled': 0,
"        \ }
"set clipboard+=unnamedplus
"let g:clipboard = {
"  \   'name': 'WslClipboard',
"  \   'copy': {
"  \      '+': 'clip.exe',
"  \      '*': 'clip.exe',
"  \    },
"  \   'paste': {
"  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"  \   },
"  \   'cache_enabled': 0,
"  \ }


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

" Y
nnoremap Y v$hy

" Serach/Replace
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader>s :s//g<left><left>
vnoremap <leader>s :s//g<left><left>
nnoremap <leader>S :%Subvert//g<left><left>
vnoremap <leader>S "hy:%Subvert/<C-r>h//gc<left><left><left>
nnoremap <leader>m :%s/\r//g<cr>

" Edit/Source vimrc
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :w<CR>:source ~/.vimrc<cr>

" JKLH Navigation
nnoremap <Down> <C-W><C-J>
nnoremap <UP> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

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
" Color
"---------------------------------------
"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme gruvbox
set background=dark

nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>

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

nnoremap <leader>q :q<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>w :wa<CR>
au BufRead,BufNewFile *.xaml setfiletype xml

filetype plugin indent on

" edit q macro
noremap <leader>eq :let @q='<C-R><C-R>q'
noremap <leader>ea :let @a='<C-R><C-R>a'

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
:set cscopequickfix=""

" enable mouse support
:set mouse=a

set tabstop=4 shiftwidth=4 expandtab
"autocmd BufEnter *.h :setlocal filetype=c
"autocmd FileType c,dts setlocal noexpandtab

"enter without going into insert mode
nnoremap <Enter> o<esc>

" generate definition from declaration
nmap <leader>gf m,^"ayt;?class<cr>w"bye<c-C>G<enter><enter>"apA {<enter>}<esc>kf(B"bPa::<esc><C-C>[`m-

" don't create backupfiles
set nobackup nowritebackup

function! AddPrints()
  %s/^{\n/{qDebug() << __FUNCTION__ << __LINE__;\r/g
  %s/\(^\w.*{\)/\1\rqDebug() << __FUNCTION__ << __LINE__;/g
endfunction

nnoremap <leader>d :call AddPrints()<CR>
