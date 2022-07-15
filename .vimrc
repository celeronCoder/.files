" ------------------------- General Settings -----------------------
syntax on
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set wildmenu
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set formatoptions-=cro
set background=dark
set hidden
set autowrite
set encoding=UTF-8
set autoread
set spelllang=en_u
set spell
set noruler
set confirm
set autoindent
set cursorline

" Status-line
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %M " Changes from last Modified
set statusline+=\ %y " file-type
set statusline+=\ %r " read only
set statusline+=\ %F " full path of the file

set statusline+=%= "Right side settings
set statusline+=%#DiffChange#
set statusline+=\ %c:%l/%L
set statusline+=\ %p%% " percent of how much we are down the file
set statusline+=\ [%n] "Buffer Number

"---------------- Auto visual mode ---------------------------
set mouse+=a

filetype plugin indent on
filetype plugin on

" ---------------- Plugins (VimPlug) ---------------------------
call plug#begin("~/.vim/plugged")
    " ---------------- ColorSchemes --------------------
    Plug 'gruvbox-community/gruvbox'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'joshdick/onedark.vim', {'as':'onedark'}
    Plug 'dracula/vim', {'as' : 'dracula'}
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'yous/vim-open-color'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'lilydjwg/colorizer'

    " ----------- NerdTree -------------
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'

    " ------------ COC -----------------
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

    let g:coc_global_extensions = ['coc-css', 
                \ 'coc-html', 
                \'coc-json', 
                \'coc-tsserver', 
                \'coc-prettier', 
                \'coc-eslint', 
                \'coc-pairs', 
                \'coc-snippets', 
                \'coc-jedi', 
                \'coc-clangd', 
                \'coc-highlight', 
                \'coc-sh', 
                \'coc-yaml', 
                \'coc-xml',
                \'coc-emmet',
                \'coc-rust-analyzer',
                \'coc-go',
                \'coc-stylua',
                \'coc-deno',
    \]
    
    "-------------- Language Server --------------------
    Plug 'sheerun/vim-polyglot'

    "--------------- NerdTree Plugins -----------------
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    "---------------- GitGutter ---------------------"
    Plug 'airblade/vim-gitgutter'

    "--------------- Lua Plugins ----------------------
    Plug 'nvim-lua/plenary.nvim'
    Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

"-------------- Syntax Mappings ----------------------------
au BufRead, BufNewFile *.fountain set filetype=fountain "enable fountain syntax mapping

"------------------ Color Settings ----------------------
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE

"---------------- NerdTree Config ---------------------------
let g:NERDTreeShowHidden = 0 
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['^node_modules$']
let NERTreeStatusLine = 'NERDTree'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Better display for messages set cmdheight=2 
" You will have bad experience for diagnostic messages when it's default 4000.

"-------------------------- COC Config ------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gtd <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"--------------- Async Support ---------------------
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"===================== KeyBinding ========================

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"-------------- Binding for NerdTree ----------------
map <C-b> :NERDTreeToggle<CR>

let g:NERDCreateDefaultMappings=1

map <C-/> <Plug>NERDCommenterToggle

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


map <Esc><C-c> <CR>

inoremap jk <Esc>
inoremap kj <Esc>

nnoremap <silent> <C-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

nnoremap <silent> <C-Down> :resize -2<CR>
nnoremap <silent> <C-up> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

"--------------- MAPPINGS FOR COC-PRETTER --------------------
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <C-p> <Plug>(coc-format-selected)
nmap <C-p> <Plug>(coc-format-selected)
map <C-p> <Plug>(coc-format-selected)
