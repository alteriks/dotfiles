" Specify a directory for plugins
"
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"  :PlugInstall
call plug#begin('~/.config/nvim/plug/')

"Bufferline/Tabline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'romgrk/barbar.nvim'
" Plug 'matbme/JABS.nvim'

" Loo {{{
Plug 'overcache/NeoSolarized'
"autocmd Filetype * if &ft!="calendar"| Plug 'vim-airline/vim-airline' | endif
" TODO: checking faster loading times Plug 'vim-airline/vim-airline' "OR https://github.com/itchyny/lightline.vim + https://github.com/bagrat/vim-buffet
" TODO: checking faster loading times Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
"
"Plug 'itchyny/lightline.vim'

Plug 'gennaro-tedesco/nvim-jqx' " OR use ':%!jq .' its way faster

Plug 'lambdalisue/suda.vim'
" Automatically use sudo when permissions are lacking
let g:suda_smart_edit = 1

"Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'

" }}}

Plug 'jvirtanen/vim-hcl'

" VCS
Plug 'mhinz/vim-signify' "OR https://github.com/airblade/vim-gitgutter #slower
Plug 'tpope/vim-fugitive' "TODO: Prepare Docs Startify/vim-which-key                                git support
Plug 'junegunn/gv.vim'

"Plug 'edkolev/tmuxline.vim' "Run only once to generate file for TMUX
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'easymotion/vim-easymotion' "TODO: Prepare Docs Startify/vim-which-key
" >> conflict with machakann/vim-sandwich
Plug 'yegappan/mru' "TODO: Prepare Docs Startify/vim-which-key TODO: FZFMru. Startify is better?!
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
"Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' } " slow
"loads for every buffer when opening ctrlspace workspace
"Plug 'mbbill/undotree'
"Plug 'ap/vim-css-color', { 'for': 'css' } "loading on demand for css doesn't
"work https://github.com/ap/vim-css-color/issues/125

Plug 'wesQ3/vim-windowswap' "TODO: Prepare Docs Startify/vim-which-key

"Plug 'camspiers/lens.vim' "vs roman/golden-ratio
"Plug 'camspiers/animate.vim' "CPU hungry

" TODO: lukas-reineke/indent-blankline.nvim OR Yggdroot/indentLine borks ```bash```
" in markdown files
"
" Plug 'lukas-reineke/indent-blankline.nvim'
" let g:indentLine_fileTypeExclude = ['startify']
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
let g:indent_blankline_char_list = ['┊']
" let g:indent_blankline_space_char = '.'

Plug 'SirVer/ultisnips' "TODO: Prepare Docs Startify/vim-which-key

" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
let g:tcomment#blank_lines=0
" Override default comment string https://github.com/tomtom/tcomment_vim/issues/14
set cms=#\ %s

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" Plug 'vim-ctrlspace/vim-ctrlspace'
" TODO: checking faster loading times Plug 'Konfekt/vim-ctrlspace', { 'branch': 'badd' }

Plug 'dstein64/vim-startuptime'
"https://github.com/hyiltiz/vim-plugins-profile
"vim --startuptime vim.log -c 'quit'; cat vim.log
"https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins

"Adds option to compare (diff) when swap file is found
Plug 'chrisbra/Recover.vim'

" Search {{{
Plug 'bronson/vim-visual-star-search'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Use arch package
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo' "ctrl+r
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' } """ missing "'node'

" }}}
"Plug 'Shougo/denite.nvim'
"nmap ; :Denite buffer -split=floating -winrow=1<CR>
"nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
"nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
"nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
"
"Plug 'itchyny/calendar.vim'

" Linters {{{
Plug 'w0rp/ale'
Plug 'rodjek/vim-puppet'
" }}}
"

" Syntax highlight {{{
Plug 'chr4/nginx.vim'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'luochen1990/rainbow'
Plug 'ekalinin/Dockerfile.vim'
Plug 'folke/todo-comments.nvim'
" }}}
"
" LSP
if has('nvim-0.6')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif
" Python {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"""""let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'

"Plug 'mcchrish/nnn.vim'
Plug 'sayanarijit/xplr.vim'

" TODO: checking faster loading times Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'
" Pair of quotes, brackets
Plug 'tmsvg/pear-tree'
"Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-sandwich'
" Plug 'kylechui/nvim-surround'
"
"
Plug 'machakann/vim-highlightedyank'

Plug 'ChristianChiarulli/far.vim'
" }}}
"Plug 'machakann/vim-highlightedyank' https://www.reddit.com/r/neovim/comments/gofplz/neovim_has_added_the_ability_to_highlight_yanked/
let g:highlightedyank_highlight_duration = 250

" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua', { 'tag': '1.3.7' }

" Go to last line when opening file
Plug 'farmergreg/vim-lastplace'

" Initialize plugin system
call plug#end()
