execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

hi Normal ctermbg=none

map <C-n> :NERDTreeToggle<CR>
" Map Ctrl+n to open NERDTree at the current file
nnoremap <C-n> :NERDTreeFind<CR>

" Ability to close vim when only NERD tree is open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set pastetoggle=<F2>

"Easier window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Shows current command in a line at the bottom
set showcmd
set cmdheight=1

set statusline=%f
set laststatus=2

"Highlight search
set hlsearch

"Split window positioning
set splitright
set splitbelow

"Shows trailing . and tabs
set list
set listchars=tab:>~,nbsp:_,trail:.

"Disable swapfiles and enable persistant undos
":help undo-persistence
set noswapfile
set nobackup
set nowritebackup
if !&diff
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

"Replaces tabs with spaces in insert mode
set expandtab

set nonumber!

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Enable Copilot by default
let g:copilot_enabled = 1
imap <silent><script><expr> <Tab> copilot#Accept("\<CR>")

"Make the 81st column stand out
highlight ColorColumn ctermbg=LightMagenta
call matchadd('ColorColumn', '\%81v', 100)
