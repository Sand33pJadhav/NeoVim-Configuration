" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=3
set scrolloff=10
set expandtab
set signcolumn=yes:1
set mouse=a
filetype plugin on
"set spell! spelllang=en_us
"set completeopt=menuone,noselect
set completeopt=menuone
"let loaded_matchparen = 1
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*
" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline!
set relativenumber
set synmaxcol=128
syntax sync minlines=256

"set cursorcolumn

" Set cursor line color on visual mode
"highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

"highlight LineNr cterm=none ctermfg=none guifg=none guibg=none

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
"if exists("&termguicolors") && exists("&winblend")
"  syntax enable
"  set termguicolors
"  set winblend=0
"  set wildoptions=pum
"  set pumblend=5
"  set background=dark
  " Use NeoSolarized
"  let g:neosolarized_termtrans=1
"  runtime ./colors/NeoSolarized.vim
  "runtime ./colors/jellybeans.vim

"  colorscheme NeoSolarized
"endif

hi Normal ctermbg=none guibg=none
highlight clear LineNr
highlight LineNr guifg=#4682B4

"colorscheme jellybeans
"colorscheme vscode
"highlight Pmenu guibg=NONE ctermbg=NONE ctermfg=white

"highlight CocMenuSel ctermbg=lightblue guibg=lightblue

"highlight CocMenuSel ctermfg=lightblue
"
hi FloatermBorder ctermbg=cyan guibg=cyan

hi SignColumn ctermbg=NONE

" let s:borderchars = get(g:, 'coc_borderchars', ['─', '│', '─', '│', '┌', '┐', '┘', '└'])
" let s:rounded_borderchars = s:borderchars[0:3] + ['╭', '╮', '╯', '╰']
" let s:borderjoinchars = get(g:, 'coc_border_joinchars', ['┬', '┤', '┴', '├'])
" let s:popup_list_api = exists('*popup_list')


" use <tab> for trigger completion and navigate to the next complete item
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"


"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" Fold
set foldmethod=manual

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

"Autosave

autocmd TextChanged,TextChangedI <buffer> silent write

"Airline Settings

let g:airline_theme='simple'
let g:vem_tabline_show = 2
let g:vem_tabline_show_icon = 0

let g:neovide_window_floating_opacity = 0
let g:neovide_floating_blur = 0
let g:neovide_window_floating_blur = 0

let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

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


nnoremap <C-`> :PreviewMarkdown tab<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-q> :wqa<CR>
set completeopt-=preview " For No Previews Formatter
nnoremap <silent> <leader>f :Format<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-s> :w<CR>
nnoremap <Tab> :bn<CR>
nnoremap <C-x> :bd<CR>
"nnoremap <C-w> :wincmd w<CR>
nnoremap <C-a> ggVG<CR>
nnoremap <S-c> yyP<CR>
nnoremap <C-c> :!pbcopy < %<CR>
nmap f :HopWord<CR>
" Split window
nmap ss :split<Return><C-w>w
nmap vs :vsplit<Return><C-w>w
"Move window
nnoremap <C-w> :wincmd w<CR>
nnoremap cc caw
" Resize window
nmap <S-w><left> <S-w><
nmap <S-w><right> <S-w>>
nmap <S-w><up> <S-w>+
nmap <S-w><down> <S-w>-

vnoremap <Tab> >
vnoremap <S-Tab> <

autocmd filetype cpp nnoremap <C-b> :!c++ --std=gnu++17 % && ./a.out < input.txt > output.txt<CR>
autocmd filetype cpp nnoremap <C-S-b> :FloatermNew --autoclose=0 c++ --std=gnu++11 % && ./a.out<CR>

autocmd filetype python nnoremap <C-b> :!python3 % < input.txt > output.txt<CR>
autocmd filetype python nnoremap <C-S-b> :FloatermNew --autoclose=0 python3 %<CR>

autocmd filetype java nnoremap <C-b> :!javac % && java %:r < input.txt > output.txt<CR>
autocmd filetype java nnoremap <C-S-b> :FloatermNew --autoclose=0 javac % && java %:r<CR>


let g:python3_host_prog="/usr/bin/python3"

" markdown
"let g:preview_markdown_viewer="mdr"
let g:preview_markdown_parser="glow"
let g:preview_markdown_auto_update=0
"let g:preview_markdown_vertical=1


"Hop
lua << EOF

require'hop'.setup()

EOF

"Templates

autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/template.cpp


" GitGutter

let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = '++'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'


"Floaterm 
let g:floaterm_wintype = "float"
hi Floaterm guifg=cyan
hi FloatermBorder guibg=orange guifg=cyan

"Indent Guide
lua << EOF
vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

EOF
""Java jdtls

" lua require'lspconfig'.jdtls.setup{
" \   cmd = { 'jdtls' },
" \   root_dir = function(fname)
" \      return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
" \   end
" \}


" lua << EOF


" require("nvim-lsp-installer").setup({
"     automatic_installation = true,
"     ui = {
"         icons = {
"             server_installed = "✓",
"             server_pending = "➜",
"             server_uninstalled = "✗"
"         }
"     }
" })

" -- Mappings.
" local opts = { noremap=true, silent=true }

" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"     -- Enable completion triggered by <c-x><c-o>
"     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

"     local bufopts = { noremap=true, silent=true, buffer=bufnr }
"     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
"     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
"     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
"     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
"     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
"     vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
"     vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
"     vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
"     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
"     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
"     vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
"     vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
"     vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
"     vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
" end

" local lsp_flags = {
"   -- This is the default in Nvim 0.7+
"   debounce_text_changes = 150,
" }
" require('lspconfig')['pyright'].setup{
"     on_attach = on_attach,
"     flags = lsp_flags,
" }
" require('lspconfig')['tsserver'].setup{
"     on_attach = on_attach,
"     flags = lsp_flags,
" }
" require('lspconfig')['clangd'].setup{
"     on_attach = on_attach,
"     flags = lsp_flags,
" }
" require'lspconfig'.jdtls.setup{
"    cmd = { 'jdtls' },
"    root_dir = function(fname)
"       return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
"    end
" }

"  -- this part is telling Neovim to use the lsp server
" --local servers = { 'pyright', 'tsserver', 'jdtls' }
" --for _, lsp in pairs(servers) do
" --     require('lspconfig')[lsp].setup {
" --         on_attach = on_attach,
" --         flags = {
" --           debounce_text_changes = 150,
" --         }
" --     }
" --end

" -- this is for diagnositcs signs on the line number column
" -- use this to beautify the plain E W signs to more fun ones
" -- !important nerdfonts needs to be setup for this to work in your terminal
" local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
" for type, icon in pairs(signs) do
"     local hl = "DiagnosticSign" .. type
"     vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
" end
" EOF
"

lua << EOF
-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        --vscPopupFront = '#f5f8f6',
        vscPopupBack = 'NONE',
        --vscSelection = 'NONE',
    },
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    --group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
      --  Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    --}
})
EOF
