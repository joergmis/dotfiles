set nocompatible
set background=dark
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set autoread
set hidden
syntax on
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set colorcolumn=80

set tags=../tags,./tags;,tags
let &path.=".,/usr/include/**/*,/home/mj/workbench/embedded/**/*"

set expandtab
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'fatih/vim-hclfmt'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
call plug#end()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Cr> pumvisible() ? "\<C-y>" : "\<CR>"

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

colorscheme nord

set directory=$HOME/.vim/swp//

nmap <C-z> :TagbarToggle<CR>
set number
set relativenumber
set exrc
set secure
set incsearch
set hlsearch

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=45
let NERDTreeShowHidden = 1

let g:hcl_fmt_autosave = 1
let g:tf_fmt_autosave = 1
let g:nomad_fmt_autosave = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

autocmd BufWritePost *.cpp exe ":UpdateTags"

" location of the zettelkasten
let g:zettelkasten = "~/workbench/website/content/zettelkasten/"

" create a new zettel with the timestamp and name
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nnz :NewZettel 

function! HandleFZF(file)
  "let filename = fnameescape(fnamemodify(a:file, ":t"))
  "why only the tail ?  I believe the whole filename must be linked
  "unless everything is flat ...
  let filename = fnameescape(a:file)
  let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
  "Insert the markdown link to the file in the current buffer
  let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
  put=mdlink
endfunction

command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
command! -nargs=1 InsertZettel :call fzf#run({'sink': 'HandleFZF'})

" insert link to zettel that can be selected via fzf
nnoremap <leader>niz :InsertZettel

" generate ctags in current directory
nnoremap <leader>tt :silent !ctags -R . <CR>:redraw!<CR>

" go to the index directory of the notes -> see zettelkasten variable for
" directory
nnoremap <leader>ni :execute ":e" zettelkasten . "/index.md"<CR>:cd ":e" zettelkasten<CR>


