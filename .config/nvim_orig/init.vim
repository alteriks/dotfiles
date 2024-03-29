":map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
":nmap  :nnoremap :nunmap    Normal
":vmap  :vnoremap :vunmap    Visual and Select
":smap  :snoremap :sunmap    Select
":xmap  :xnoremap :xunmap    Visual
":omap  :onoremap :ounmap    Operator-pending
":map!  :noremap! :unmap!    Insert and Command-line
":imap  :inoremap :iunmap    Insert
":lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
":cmap  :cnoremap :cunmap    Command-line
":tmap  :tnoremap :tunmap    Terminal-Job

"Map leader to space
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>
"map <Space> <leader>

" Plugins file
source $HOME/.config/nvim/plugins.vim

"kyazdani42/nvim-tree.lua
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]

" deoplete tab-complete
inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
"automatically closing the scratch window at the top of the vim window on finishing a complete or leaving insert
augroup pumvisible
  autocmd!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" " Disable default mappings
" let g:nnn#set_default_mappings = 0

" " Then set your own
" nnoremap <silent> <leader>nn :NnnPicker<CR>

" " Or override
" " Start nnn in the current file's directory
" nnoremap <leader>n :NnnPicker '%:p:h'<CR>
" " Opens the nnn window in a split
" let g:nnn#layout = 'new' " or vnew, tabnew etc.

" " Or pass a dictionary with window size
" let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" " Floating window (neovim latest and vim with patch 8.2.191)
" let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" let g:nnn#action = {
"       \ '<c-t>': 'tab split',
"       \ '<c-x>': 'split',
"       \ '<c-v>': 'vsplit' }

"'vim-syntastic/syntastic'
" Note that airline will set the statusline info, so these three lines are not needed
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""'overcache/NeoSolarized'
""https://github.com/icymind/NeoSolarized#tmux

let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
set background=dark
colorscheme NeoSolarized
set termguicolors

"'vim-airline/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_splits = 0

let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 1

hi link CtrlSpaceSearch IncSearch
hi link CtrlSpaceNormal Normal
hi link CtrlSpaceSelected Visual

let g:airline_exclude_preview = 1

let g:CtrlSpaceCacheDir = $HOME . '/.cache/nvim'
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"let g:CtrlSpaceStatuslineFunction =
"      \  "airline#extensions#ctrlspace#statusline()"

" TAB in general mode will move to text buffer
"nnoremap <Tab> :bnext<CR>
nnoremap <Tab> :CtrlSpaceGoDown<CR>
" SHIFT-TAB will go back
"nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-Tab> :CtrlSpaceGoUp<CR>


let g:CtrlSpaceDefaultMappingKey = "<C-space> "

let g:CtrlSpaceUseArrowsInTerm = 1


"let g:airline_exclude_preview = 1 ????
"let g:CtrlSpaceCacheDir

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

function! PrintFooBar(k)
  echo "Foo Bar!"
endfunction

let g:CtrlSpaceKeys = { "Buffer": { "a": "PrintFooBar" } }


"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Allows multiple nonsaved buffers to be open in the background
set hidden

" 'mhinz/vim-signify'
" default updatetime 4000ms is not good for async update
set updatetime=100
let g:signify_vcs_list = [ 'git', 'yadm' ]
let g:signify_update_on_focusgained = 1
"let g:signify_line_highlight = 1
let g:signify_realtime = 1

"'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"'yegappan/mru'
"let MRU_Use_Current_Window = 1
let MRU_Window_Height = 15
let MRU_Add_Menu = 0
let MRU_File = $HOME . '/.cache/nvim/vim_mru_files'
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix

"yank/paste with xclip
"ctrl+shift+v to paste yanked buffer (unnamedplus) doesn't conflict with
set clipboard=unnamedplus
"MiddleClick in tmux.conf with xclip
"set clipboard=unnamed
"vnoremap y "*y
"vnoremap p "*p


" Linters 'w0rp/ale'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'puppet': ['puppetlint'],
\}
let g:ale_fix_on_save = 1

" 'plasticboy/vim-markdown'
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 3
set conceallevel=2

" 'mhinz/vim-startify'
let g:startify_unlisted_buffer = 1
let g:startify_bookmarks = [
\ { 'a': '~/.config/zsh/aliases' },
\ { 'f': '~/.config/zsh/functions' },
\ { 'i': '~/.config/i3/config'},
\ { 'n': '~/.config/nvim/init.vim' },
\ { 'p': '~/.config/zsh/privyzsh' },
\ { 't': '~/.config/tmux/tmux.conf' },
\ { 'z': '~/.config/zsh/.zshrc' },
\ ]
"TODO: create script which will parse txt/md file and create custom footer. See: startify-faq-11
let g:startify_custom_footer =
\ [
\ '', "   Put new things here!", '',
\ "   Try :UndotreeToggle https://github.com/mbbill/undotree", '',
\ "   Try bronson/vim-visual-star-search Select with VISUALMODE and search for pattern using */# ", '',
\ "   Try :SSave    save a session in vim-startify", '',
\ "   Try :Ultisnip 'TODO<tab> + yaml.ansible'", '',
\ "   Try <leader> \\", '',
\ "   Try :FZF <leader>o", '',
\ ]

"How to disable common but unimportant files?~
let g:startify_skiplist = [
\ '^/tmp',
\ '^/mnt/nfs',
\ '/project/.*/documentation',
\ escape(fnamemodify($HOME, ':p'), '\') .'mysecret.txt',
\ ]

"Plug 'junegunn/fzf.vim'
" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'
" [Buffers] Jump to the existing window if possible
" let g:fzf_buffers_jump = 1

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>F :FZF!<CR> "fullscreen"
nnoremap <silent> <leader>b  :FzfBuffers<CR>
nnoremap <silent> <leader>l :FzfLines<CR>
nnoremap <silent> <leader>L :FzfBLines<CR>
nnoremap <silent> <leader>`  :FzfMarks<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <F1> :FzfHelptags<CR>
inoremap <silent> <F1> <ESC>:FzfHelptags<CR>`

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


set mouse=a

"mkdir ~/nvim for shada (old viminfo)
set shada='50,<1000,s100,:1000,n~/.local/share/nvim/shada/main.shada

"better tab completion
set wildmode=full

" https://jeffkreeftmeijer.com/vim-number/
set relativenumber
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"disable netrw
let loaded_netrwPlugin = 1
"enable fzf instead
" autocmd VimEnter * if isdirectory(expand("<amatch>")) | exe 'FZF! '.expand("<amatch>") | endif

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25

"Easier split navigations
"We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"More natural split opening
"Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

"Source config after every write
"autocmd BufWritePost ~/.config/nvim/init.vim source %

" Paste at end of the line
map <Leader>p A<Space><ESC>p

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:rainbow_active = 1

let g:peekaboo_window="call CreateCenteredFloatingWindow()"

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Map leader to which_key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}
let g:which_key_use_floating_win = 0
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


"Plug 'wesQ3/vim-windowswap'
let g:which_key_map.w = {
      \ 'name' : '+swap window' ,
      \ 'w' : [':call WindowSwap#EasyWindowSwap()'                        , 'easy window swap'],
      \ }


" Plug 'mhinz/vim-signify'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit -m "autocommit"'       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':SignifyHunkDiff'                  , 'preview hunk diff'],
      \ 'H' : [':SignifyToggleHighlight'           , 'highlight hunks'],
      \ 'j' : ['<Plug>(signify-next-hunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(signify-prev-hunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'u' : [':SignifyHunkUndo'                  , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

function! GF(...)
    call fzf#run({'dir': a:1, 'source': 'find . -type f', 'options':['-1', '--query', expand('<cfile>')], 'sink': 'e'})
endfunction
command! -nargs=* GF :call GF(<f-args>)
"nnoremap gf :GF .<CR>
" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':FzfHistory/'     , 'history'],
      \ ';' : [':FzfCommands'     , 'commands'],
      \ 'a' : [':FzfAg'           , 'text Ag'],
      \ 'B' : [':FzfBLines'       , 'current buffer'],
      \ 'b' : [':FzfBuffers'      , 'open buffers'],
      \ 'c' : [':FzfCommits'      , 'commits'],
      \ 'C' : [':FzfBCommits'     , 'buffer commits'],
      \ 'f' : [':FzfFiles'        , 'files'],
      \ 'F' : [':GF .'            , 'files fullscreen'],
      \ 'g' : [':FzfGFiles'       , 'git files'],
      \ 'G' : [':FzfGFiles?'      , 'modified git files'],
      \ 'h' : [':FzfHistory'      , 'file history'],
      \ 'H' : [':FzfHistory:'     , 'command history'],
      \ 'l' : [':FzfLines'        , 'lines'] ,
      \ 'm' : [':FzfMarks'        , 'marks'] ,
      \ 'M' : [':FzfMaps'         , 'normal maps'] ,
      \ 'p' : [':FzfHelptags'     , 'help tags'] ,
      \ 'P' : [':FzfTags'         , 'project tags'],
      \ 's' : [':FzfSnippets'     , 'snippets'],
      \ 'S' : [':FzfColors'       , 'color schemes'],
      \ 't' : [':FzfRg'           , 'text Rg'],
      \ 'T' : [':FzfBTags'        , 'buffer tags'],
      \ 'w' : [':FzfWindows'      , 'search windows'],
      \ 'y' : [':FzfFiletypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

let g:which_key_map.q = {
      \ 'name' : 'Quuuit' ,
      \ 'q' : [':call Bye()'    , 'Bye, buffer, activate next one'],
      \ 'Q' : [':qa!'     , 'Quit all without saving'],
      \ }

let g:far#source='rgnvim'
set lazyredraw            " improve scrolling performance when navigating through large results
let g:far#window_width=60
" Use %:p with buffer option only
let g:far#file_mask_favorites=['%:p', '**/*.*', '**/*.js', '**/*.py', '**/*.java', '**/*.css', '**/*.html', '**/*.vim', '**/*.cpp', '**/*.c', '**/*.h', ]
let g:far#window_min_content_width=30
let g:far#enable_undo=1

let g:which_key_map.1 = 'Select buffer 1'
let g:which_key_map.2 = 'Select buffer 2'
let g:which_key_map.3 = 'Select buffer 3'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'

" Toggle paste mode mode with <Leader>pp
nnoremap <Leader>pp :set paste!<CR>

" Indent whole file while preserving cursor location with <Leader>=
nnoremap <Leader>= m'gg=G`'
let g:which_key_map['='] = 'Indent buffer'

" Clear trailing whitespace
nnoremap <Leader>c<Leader> :%s/\s\+$//g<CR>:nohlsearch<CR>
let g:which_key_map.c = {
  \ 'name' : '+clear',
  \ 'SPACE' : 'Clear whitespace',
  \ }


" select all text in buffer while preserving location
map <Leader>a ggVG
let g:which_key_map.a = 'Select all'

nnoremap <leader># :noh<CR>
let g:which_key_map['#'] = 'Clear highlight'

" I hate escape more than anything else
"inoremap jk <Esc>
"inoremap kj <Esc>

"various
"Always open help in vertical split
autocmd FileType help wincmd L

" Alternate way to save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

set expandtab "Replace <TAB> with <SPACE>
set shiftwidth=2 "Indent 2x<SPACE>

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

"Insert newline and return to NORMAL
nnoremap <silent> <leader>o :<C-u>call append(line("."), repeat([""], v:count1))<CR>
"nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
let g:which_key_map.o = 'Insert newline below and return to NORMAL'
let g:which_key_map.O = 'Insert newline below and return to NORMAL'

nmap <leader>\ :vsplit<CR>
nmap <leader>\| :botright vsplit<CR>
nmap <leader>- :split<CR>
nmap <leader>_ :botright split<CR>

"Close buffer without closing the window and activate
"Quit vim if only one buffer is loaded
function! Bye()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
    :bp|sp|bn|bd
  else
    :q
  endif
endfunction
nmap <silent> <C-q> :call Bye()<CR>


"" Hide status line
"autocmd! FileType calendar
"autocmd  FileType calendar set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

"let g:calendar_first_day = "monday"
"let g:calendar_frame = "unicode_round"
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"source ~/.cache/calendar.vim/credentials.vim
"augroup calendar-mappings
"  autocmd!

"  " diamond cursor
"  autocmd FileType calendar nmap <buffer> i <Plug>(calendar_up)
"  autocmd FileType calendar nmap <buffer> j <Plug>(calendar_left)
"  autocmd FileType calendar nmap <buffer> k <Plug>(calendar_down)
"  autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)

"  " swap v and V
"  autocmd FileType calendar nmap <buffer> V <Plug>(calendar_visual)
"  autocmd FileType calendar nmap <buffer> v <Plug>(calendar_visual_line)

"  " unmap <C-n>, <C-p> for other plugins
"  "autocmd FileType calendar nunmap <buffer> <C-n>
"  "autocmd FileType calendar nunmap <buffer> <C-p>
"  "Exit with 'q'
"  autocmd FileType calendar nunmap <buffer> q
"  autocmd FileType calendar nmap q :q!<CR>
"augroup END
"

"Disable suspend - ctrl+z
nnoremap <c-z> <nop>

"""""""""""""""""TWF
" function! TwfExit(path)
"   function! TwfExitClosure(job_id, data, event) closure
"     bd!
"     try
"       let out = filereadable(a:path) ? readfile(a:path) : []
"     finally
"       silent! call delete(a:path)
"     endtry
"     if !empty(out)
"       execute 'edit! ' . out[0]
"     endif
"   endfunction
"   return funcref('TwfExitClosure')
" endfunction
" function! s:isdir(dir)
"   return !empty(a:dir) && (isdirectory(a:dir) ||
"     \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
" endfunction

" augroup twf_ftdetect
"   autocmd!
"   " nuke netrw brain damage
"   autocmd VimEnter * silent! au! FileExplorer *
"   autocmd BufEnter * if <SID>isdir(expand('%'))
"     \ | redraw | echo ''
"     \ | let temp = tempname()
"     \ | call termopen('/home/alteriks/.local/share/go/bin/twf ' . @% . ' > ' . temp, { 'on_exit': TwfExit(temp) })
"     \ | startinsert
"     \ | endif
" augroup END
"
" Unfold up to 3 folds
" Use :set foldlevel=X to change on fly
" Some plugins override this setting ie plasticboy/vim-markdown, check with
" `:verbose set foldmethod` and `:verbose set foldlevel` to verify
set foldlevelstart=3
set foldlevel=3

" searches are case insensitive...
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter.

" check if file has been changed, auto reload
" in nvim 5.0 use help file-change-detect :help watch-file
set autoread
au FocusGained * :checktime

" no more looking for $, yank to eol
nnoremap Y y$

" Allow saving of files as sudo when I forgot to start vim using sudo.
" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" "Plug 'machakann/vim-sandwich'
" " if you have not copied default recipes
" let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" "runtime macros/sandwich/keymasp/surround.vim

" " add spaces inside bracket
" let g:sandwich#recipes += [
"       \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
"       \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
"       \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
"       \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
"       \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
"       \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
"       \ ]
" " ``` code in markdown
" let g:sandwich#recipes += [
"       \    {'buns': ['```', '```'], 'input': ['```']}
"       \  ]

imap <space> <Plug>(PearTreeSpace)
imap <s-tab> <Plug>(PearTreeJump)

" Disable highlight after searching something? - https://www.reddit.com/r/vim/comments/v1od2t/disable_highlight_after_searching_something/
nnoremap <C-l> :nohlsearch<CR><C-l>
inoremap <C-l> <Cmd>:exe "normal \<C-l>"<CR>

augroup AUTOSAVE
  au!
  autocmd InsertLeave,TextChanged,FocusLost **/memo/* silent! write
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml let g:indentLine_enabled = 1
" if $USER != 'root'
lua << EOF
require('lualine').setup {
  options = {theme = 'solarized_dark'}
  }

vim.opt.termguicolors = true
require("bufferline").setup{}

  require("todo-comments").setup {
    sign_priority = 99, -- sign priority
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  -- require'lspconfig'.yamlls.setup{
  -- cmd = { "/home/alteriks/.local/share/npm/bin/yaml-language-server", "--stdio" }
  -- }
  -- require'lspconfig'.pyls.setup{}
EOF
" endif
"
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
let g:nnn#replace_netrw = 1
