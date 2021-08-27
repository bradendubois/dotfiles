"
"   init.vim
"


"""""""""""""""""
"    Plugins    "
"""""""""""""""""


call plug#begin()


"""" general theming
Plug 'shime/vim-livedown'                           " live Markdown editor
Plug 'joshdick/onedark.vim'                         " One Dark color scheme
Plug 'arcticicestudio/nord-vim'                     " Nord color scheme
Plug 'folke/tokyonight.nvim', {'branch': 'main'}    " Tokyo Night
Plug 'ryanoasis/vim-devicons'                       " icons
Plug 'itchyny/lightline.vim'                        " activity bar


"""" functionality / major
Plug 'tpope/vim-fugitive'       " git
Plug 'scrooloose/nerdtree'      " file browser
Plug 'majutsushi/tagbar'        " tags (needs 'ctags' installed)
Plug 'KabbAmine/vCoolor.vim'    " insert color
Plug 'vim-scripts/loremipsum'   " generate lorem ipsum
Plug 'junegunn/goyo.vim'        " focus / zen-mode
Plug 'junegunn/limelight.vim'   " focus by greying non-focused code


"""" q.o.l. / minor
Plug 'tpope/vim-sensible'       " nice defaults
Plug 'ervandew/supertab'        " tab to complete
Plug 'jiangmiao/auto-pairs'     " bracket pairs
Plug 'junegunn/vim-easy-align'  " alignment
Plug 'alvan/vim-closetag'       " close tags
Plug 'chrisbra/Colorizer'       " color tags
Plug 'dkarter/bullets.vim'      " automatic bulleting
Plug 'lervag/vimtex'            " latex


"""" languages
Plug 'sheerun/vim-polyglot'                                     " language pack
Plug 'metakirby5/codi.vim'                                      " python realtime
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }    " generate Python docstrings
Plug 'deoplete-plugins/deoplete-jedi'                           " Python completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


call plug#end()

" Opaque Background (Comment out to use terminal's profile)
" set termguicolors

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

filetype plugin indent on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=UTF-8
set number
set title

syntax on


" color scheme
" colorscheme onedark
" colorscheme nord
colorscheme tokyonight

"""""""""""""""""
"   Settings    "
"""""""""""""""""

let g:lightline = { 'colorscheme': 'one', 'background': 'dark' }
let g:limelight_conceal_ctermfg = 'gray'


let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "brave"


let g:pydocstring_ignore_init = 1
let g:pydocstring_formatter = 'numpy'


let g:colorizer_auto_color = 1


let g:tokyonight_style = "storm"


" close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""""""""""""""""
"   Mappings    "
"""""""""""""""""

map <C-p> :Pydocstring      " create Python docstring
map <F6>  :LivedownToggle   " toggle markdown viewer


" toggles
map <C-o> :NERDTreeToggle<CR>
map <C-k> :Goyo<CR>
map <C-l> :Limelight!!<CR>
map <F8>  :TagbarToggle<CR>
