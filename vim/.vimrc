syntax enable
execute pathogen#infect()
set backspace=indent,eol,start
let mapleader = ","
let g:mapleader = ","
so ~/.vim/plugins.vim

filetype plugin indent on

set autowriteall            " Automatically write the file when switching buffer"
set complete=.,w,b,u        " Set desired auto completion"

set runtimepath^=~/.vim/bundle/ctrlp.vim
set noerrorbells visualbell t_vb=    " No damn bells"

"----------- Laravel Specifics --------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:

nmap <Leader>lfc :CtrlP app/Http/Controllers/
nmap <Leader>lfv :CtrlP resources/views
nmap <Leader>lfm :CtrlP app/

nmap <Leader>arl :!php artisan route:list<cr>

"----------- Split Management ----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"---------- Git Command Mapping ---------------------"
nmap gal :!git add .<cr>
nmap gc :!git commit -m "
nmap gp :!git push<cr>
nmap gs :!git status<cr>

"--------- Plugins ----------------"
"--------- Vim Test --------------"
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

nmap tf :TestFile<cr>
nmap tn :TestNearest<cr>
nmap ts :TestSuite<cr>
nmap tl :TestLast<cr>
nmap tv :TestVisit<cr>

"--------- UltiSnippets -----------"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"--------- doc block maker --------"
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>
"---------- PHP cs fixes --------"
" If php-cs-fixer is in $PATH, you don't need to define the line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "psr2"                   " options: --level (default: symfony)
let g:php_cs_fixer_config = "default"               " options: --config
" If you want to define specific fixers:
" let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
" let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default: @PSR2)
" let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
" let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"                " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1      " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                     " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                     " Return the output of the command if 1, else an inline information.
"--------- Vim PHP namespace -----"
" ---- Use Statement ------
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" ------ Fully Qualified Namespace ----"
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>fn PhpExpandClass()<CR>
autocmd FileType php noremap <Leader>fn :call PhpExpandClass()<CR>

"---------- Auto Sorting ---------"
""Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su !awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"---------- CTRL-P ---------------"
nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>

nmap f :CtrlP<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git|coverage\'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
"-----------VISUAL-----------------"

set t_Co=256   " This may or may not be needed.

set background=dark
colorscheme PaperColor
set number
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set linespace=15
set guifont=Fira_Code:h13
if has('gui_macvim')
    set macligatures
endif
set guioptions-=e
hi LineNr guibg=bg
set foldcolumn=0
"---- Get rid of left side and right side scroll bars ---"
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"-----------MAPPING---------------"
verbose nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"------- Laravel Artisan commands -"
nmap am :!php artisan make:
nmap art :!php artisan
nmap mrs :!php artisan migrate:refresh --seed<cr>
nmap amc :!php artisan make:controller
nmap amm :!php artisan make:model
nmap amf :!php artisan make:factory
nmap amt :!php artisan make:test
nmap amr :!php artisan make:request
nmap amp :!php artisan make:policy

"-------- PhpUnit test aliases ----"
nmap pu :!vendor/bin/phpunit
nmap puf :!vendor/bin/phpunit --filter

"---- NERD TREE CONFIFURATION -----"

nmap t :NERDTreeToggle<cr>

set nocompatible

let NERDTreeHijackNetrw = 0

" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()


filetype plugin indent on
runtime! config/**/*.vim

"-------- AUTO Commands -------"
" Automatically source the vimrc file on write"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
