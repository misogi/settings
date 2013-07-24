set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
syntax on
filetype on

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

" ------------------- NeoComplete ------------------------------
if has('lua')
  NeoBundle 'Shougo/neocomplete'
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Plugin key-mappings.
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
endif

" ------------------ vim-rails -------------------------------
""{{{
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
let g:rails_statusline = 1

function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"}}}

" -------------------  ------------------------------
filetype indent on
filetype plugin on

