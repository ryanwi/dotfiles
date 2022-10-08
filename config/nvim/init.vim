" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ggandor/leap.nvim'

" Other languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Display options
syntax on

set history=1000
set number
set relativenumber
set rnu

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Space bar to clear search
nmap <space> :let @/ = ""<CR>

" CTRL-f for fzf
nnoremap <silent> <C-f> :Files<CR>

if $TERM =~ '256'
  set termguicolors " true colors
  set t_Co=256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
