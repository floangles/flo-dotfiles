" FLO VIMRC

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

set noswapfile

" Enable line visualisation when vim start
set number
"Enable relative number
set relativenumber

" Html tags
imap <C-t> <></><Esc>5hdiwp3lpT>i

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'thoughtbot/vim-rspec'
Plugin 'textobj-user'
Plugin 'textobj-rubyblock'
Plugin 'ayu-theme/ayu-vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'mileszs/ack.vim'
Plugin 'ag.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'junegunn/fzf.vim'
Plugin 'erikzaadi/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'delimitMate.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'avakhov/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'derekwyatt/vim-scala'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-projectionist'
Plugin 'gurpreetatwal/vim-avro'
Plugin 'elzr/vim-json'
Plugin 'AndrewRadev/splitjoin.vim'

runtime macros/matchit.vim

" emmet
" let g:user_emmet_leader_key=','

" linter
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'proto': ['protoc-gen-lint']
\}

let g:ale_lint_on_save=1

" Slow cursor
set lazyredraw

" escape with jj
inoremap jj <Esc>

" copy past
noremap <leader>y "*y
noremap <leader>Y "+y

" surround
nmap <leader>q ysiw'
nmap <leader>qq ysiw"


" Syntaxe highlited slow
set synmaxcol=128
syntax sync minlines=256


" Autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Leader Snoke
let mapleader = "\<Space>"

" FZF config
set rtp+=/usr/local/opt/fzf
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <silent> <C-p> :FZF<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
"let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPLastMode'
"let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_max_files = 0
"let g:ctrlp_use_caching = 0
let g:ackprg = 'ag --vimgrep'

execute pathogen#infect()

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-R> <C-W><C-r>
set splitbelow
set splitright

" open ctag in tab/vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = 'Dispatch! bundle exec rake test SPEC={spec}'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" copy file path
map <Leader>c :!echo % \| pbcopy<cr>

" Nerdtree
map <C-o> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let NERDTreeMapOpenInTab='\r'

" Indent the all file
nmap <Leader>i mmgg=G`m<CR>

" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>

" Edit your vimrc in a new tab
nmap <leader>vi :tabedit ~/.vimrc<cr>

" Copy the entire buffer into the system register
nmap <leader>co ggVG*y

" Edit the db/schema.rb Rails file in a split
nmap <leader>sc :split db/schema.rb<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e


" Copied from <http://vim.wikia.com/wiki/Remove_unwanted_spaces>
function! TrimWhiteSpace()
  " do not record the whitespace removal in the undo history
  " <http://vim.1045645.n5.nabble.com/there-s-undojoin-how-about-dotjoin-td1203135.html>
  try
    undojoin
  catch
    " probably an undo was just issued, and so there's no way to
    " join the undo. which sucks.
  endtry
  %s/\s*$//
  ''
endfunction

autocmd! FileWritePre * :call TrimWhiteSpace()
autocmd! FileAppendPre * :call TrimWhiteSpace()
autocmd! FilterWritePre * :call TrimWhiteSpace()
autocmd! BufWritePre * :call TrimWhiteSpace()

" Make vim indent 2 spaces for ruby and scala files only
filetype plugin indent on
set sw=2
set ts=2
set autoindent
set expandtab
:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

" indent for scala file
let g:scala_scaladoc_indent = 1

" theme for monokai
syntax on
colorscheme monokai

" Search Configuration
" --------------------------------
set incsearch
set hlsearch
nmap <leader>h :nohlsearch<cr>
set ignorecase

" manually, regenerate ctags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" get current path of a file
:inoremap \fp <C-R>=getcwd()<CR>

" use the config for scala
source ~/.vim/vimrc-add/scala.vim

