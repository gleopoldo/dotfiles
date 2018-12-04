call plug#begin('~/.vim/plugged')
" Commenter
Plug 'scrooloose/nerdcommenter'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Syntax highlight
Plug 'neomake/neomake'
" Color scheme
Plug 'flazz/vim-colorschemes'
" NERDTree
Plug 'scrooloose/nerdtree'
" Emmet script
Plug 'mattn/emmet-vim'
" Airline
Plug 'vim-airline/vim-airline'
" Tagbar
Plug 'majutsushi/tagbar'
" Ag
Plug 'numkil/ag.vim'
" Vue
Plug 'posva/vim-vue'
" JSX
Plug 'mxw/vim-jsx'
" JS
Plug 'pangloss/vim-javascript'
" Vim surround
Plug 'tpope/vim-surround'
" Elixir
Plug 'elixir-editors/vim-elixir'
" Hightlight trailing spaces
Plug 'ntpeters/vim-better-whitespace'

Plug 'slim-template/vim-slim'
call plug#end()

"""""""""""""""""""""""""""""""""
"""   Neo vim configuration   """
"""""""""""""""""""""""""""""""""

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

let g:NERDTreeDirArrows=0

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Syntastic

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*', '*build*', '*LOCAL*', '*BASE', '*REMOTE*']
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['rubocop','mri']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint','ycm','clang_tidy','clang_check']
let g:syntastic_c_checkers=['gcc','make','cppcheck','clang_tidy','clang_check']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['jshint']
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_go_checkers=['golint']
let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_enable_perl_checker=1
let g:syntastic_c_clang_tidy_sort=1
let g:syntastic_c_clang_check_sort=1
let g:syntastic_c_remove_include_errors=1
let g:syntastic_quiet_messages = { "level": "[]", "file": ['*_LOCAL_*', '*_BASE_*', '*_REMOTE_*']  }
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
let g:syntastic_java_javac_options = "-g:none -source 8 -Xmaxerrs 5 -Xmaswarns 5"

" map tags through a project
" must install ctags first
command MakeTags !ctags -R .<CR>

" Opens this file on another vertical split view
command Source vnew ~/.config/nvim/init.vim

" Opens a terminal on a new tab
command Term tabnew | term

" visual config
set number
set clipboard+=unnamedplus
set runtimepath^=~/.vim/bundle/ag

" Enable Vim's fuzzy finder
set path+=**

syntax on
colorscheme wombat256mod
filetype plugin on

" Ag / Fuzzy finder configuration
" Must set the default command in order to include hidden files in the ag
" search
nmap <C-P> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Tagbar configuration
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

set expandtab shiftwidth=2 softtabstop=2 tabstop=2 smarttab
set nowrap

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Hightlight trailing spaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Navigation in neovim terminal
:tnoremap <ESC> <C-\><C-n>
:nnoremap <leader>n :NERDTreeToggle<CR>
