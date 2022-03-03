set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent smartindent             " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allows auto-indenting depending on file type
set mouse=a
syntax on                   " syntax highlighting
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
set cursorline
set termguicolors


let g:vem_tabline_show = 2
let g:vem_tabline_show_icon = 0

let g:neovide_window_floating_opacity = 0
let g:neovide_floating_blur = 0
let g:neovide_window_floating_blur = 0

set rtp+=~/.fzf
source $HOME/.config/nvim/vim-plug/plugins.vim

autocmd TextChanged,TextChangedI <buffer> silent write

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-q> :wqa<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-b> :!c++ --std=gnu++17 problem.cpp && ./a.out < input.txt > output.txt<CR>
nnoremap <C-m> :!python3 problem.py < input.txt > output.txt<CR>
nmap <F8> :TagbarToggle<CR>
set completeopt-=preview " For No Previews Formatter
nnoremap <silent> <leader>f :Format<CR>
nnoremap <C-f> :FZF<CR>
nnoremap <C-s> :w<CR>
nnoremap <Tab> :bn<CR>
nnoremap <C-x> :bd<CR>
nnoremap <C-w> :wincmd w<CR>
nnoremap <C-a> ggVG<CR>
nnoremap <S-c> yyp<CR>
nnoremap <S-v> yyP<CR>
nnoremap <S-t> :terminal<CR>

"nnoremap <S-s> I<CR>
"nnoremap <S-e> A<CR>

let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"For NeoSolarized theme
colorscheme NeoSolarized
set background=dark
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
let g:neosolarized_termBoldAsBright = 1

hi Normal ctermbg=none guibg=none
highlight clear LineNr
highlight LineNr guifg=#4682B4

"Formatter
let g:python3_host_prog="/usr/bin/python3"
au BufWrite * :Autoformat
