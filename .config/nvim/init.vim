:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} " Auto Completion

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

Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

" for airline in tmux
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'

" for prisma syntax highlight
Plug 'pantharshit00/vim-prisma'

" for svelte syntax highlight
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" for github copilot
Plug 'github/copilot.vim'

"--------------- NerdTree Plugins -----------------
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"---------------- GitGutter ---------------------"
Plug 'airblade/vim-gitgutter'



set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme happy_hacking

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" NERDTree Config
let g:NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeShowHidden=1

" resize mapping
nnoremap <silent> <C-Down> :resize -2<CR>
nnoremap <silent> <C-up> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

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

"--------------- MAPPINGS FOR COC-PRETTER --------------------
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <C-p> <Plug>(coc-format-selected)
nmap <C-p> <Plug>(coc-format-selected)
map <C-p> <Plug>(coc-format-selected)
