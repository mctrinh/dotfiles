" Minh-Chien Trinh


" COLORS {{{
syntax enable			        " enable syntax processing
"}}}


" MISC {{{
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set clipboard=unnamed
"}}}


" SPACE & TABS {{{
set tabstop=4			        " 4 space tab 
set expandtab                   " use spaces for tabs
set softtabstop=4		        " 4 space tab 
set shiftwidth=4
set modelines=1                 " make vim only use these settings for this file
filetype indent on              " load filetype-specific indent files
filetype plugin on
set autoindent
"}}}


" UI LAYOUT {{{ 
set number			            " show line numbers
set showcmd			            " show command in bottom bar
set nocursorline			    " highlight current line
set wildmenu                    " visual autocomplete for command menu
set lazyredraw
set showmatch                   " highlight matching [{()}]
"}}}


" SEARCHING {{{
set ignorecase                                      " ignore case when searching
set incsearch                                       " search as characters are entered
set hlsearch                                        " highlight all  matches
" }}}


" FOLDING {{{
set foldmethod=indent           " fold based on indent level
set foldnestmax=10              " 10 nested fold max
set foldenable                  " enable folding
nnoremap <space> za
set foldlevelstart=10           " start with fold level of 1 
" }}}


" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV '[V']
" }}}


" LEADER SHORTCUTS {{{
let mapleader=","                                    " leader is comma
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>h :A<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>et :exec ":vsp /Users/mctrinh/notes/vim/" . strftime('%m-%d-%y') . ".md"<CR> 
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call <SID>ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
" save session ~ super save
nnoremap <leader>s :mksession<CR>
" open ag.vim ~ Ag is the element silver/ The Silver Searcher to search source code in a project
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :GoDoc
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>r :call <SID>RunFile()<CR>
nnoremap <leader>b :call <SID>BuildFile()<CR>
nnoremap <leader>y "+y
"}}}


" CTRLP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'                                   " order matching files top to bottom
let g:ctrlp_switch_buffer = 0                                                   " always open files in new buffers
let g:ctrlp_working_path_mode = 0                                               " can change pwd during a vim session
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}


" SYNTASTIC {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
" }}}


" AUTOGROUPS {{{
" create language-specific settings for certain filetypes/extensions
augroup configgroup
        autocmd!
        autocmd VimEnter * highlight clear SignColumn
        autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
        autocmd BufEnter *.cls setlocal filetype=java
        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        autocmd BufEnter Makefile setlocal noexpandtab
        autocmd BufEnter *.sh setlocal tabstop=2
        autocmd BufEnter *.sh setlocal shiftwidth=2
        autocmd BufEnter *.sh setlocal softtabstop=2
        autocmd BufEnter *.py setlocal tabstop=4
        autocmd BufEnter *.md setlocal ft=markdown
        autocmd BufEnter *.go setlocal noexpandtab
        autocmd BufEnter *.avsc setlocal ft=json
augroup END
" }}}


" TESTING {{{
let test#strategy = 'neovim'
let test#python#runner = 'nose'
" }}}


" BACKUPS {{{
" vim create backup file with ~ appended to the end of the file in the current directory
" settings to move the backups to the /tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" VIM PLUG {{{
set nocompatible 
filetype off
" set the runtime path Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'zxqfl/tabnine-vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-editors/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'keith/swift.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'moll/vim-node'
Plugin 'simnalamburt/vim-mundo'
Plugin 'tpope/vim-abolish'
Plugin 'vimwiki/vimwiki'
" All plugins should come before this line!
call vundle#end()
"}}}


" AIRLINE {{{
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" }}}


" CUSTOM FUNCTIONS {{{
" toggle between number and relativenumber
function! <SID>ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc

" strips trailing whitespace at the end of files.
" this is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
        " save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
endfunc

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>RunFile()
    let ext = expand("%:e")
    if(ext == "go")
        :GoRun
    endif
endfunc

function! <SID>BuildFile()
    let ext = expand("%:e")
    if(ext == "go")
        :GoBuild
    endif
endfunc
" }}}


" ORGANIZATION {{{
" vim:foldmethod=marker:foldlevel=0
" }}}
