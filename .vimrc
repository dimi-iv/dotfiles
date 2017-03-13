execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

hi Normal ctermbg=none

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set pastetoggle=<F2>
set showcmd
set hlsearch

set splitright
set splitbelow

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

set expandtab

"Make the 81st column stand out
highlight ColorColumn ctermbg=LightMagenta
call matchadd('ColorColumn', '\%81v', 100) 

