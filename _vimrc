filetype plugin indent on
filetype plugin on
filetype on
syntax on

"�ļ�����ת�ϴα༭λ��
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
set autoindent
set guifont=Monaco:h10
set cursorline
set guioptions-=T 
set guioptions-=m
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set relativenumber
set nobackup
set selection=inclusive
"�Զ���ȫ����
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

"����������ʽ
set fdm=indent
"�ر��ļ����Զ��۵�
set foldlevel=9999

"�����ַ����뷽ʽ
set encoding=cp936
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

"Neocomplete
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,md setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,js setlocal omnifunc=nodejscomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"���ļ������ļ���
nnoremap <Leader>of :silent !explorer \%cd\% <CR>
"vim-grepper
nnoremap <Leader>ft :Grepper<Cr>
"ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

 " ����NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"Ctags
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
"taglist
map <F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist����
au InsertLeave *.* write
" vimwiki
let g:vimwiki_use_mouse = 1
nmap <leader>tt <Plug>VimwikiToggleListItem
"���vimwiki�ļ�·��
"���vimwikiת��Ϊhtml��ҳʱ�ı���·��
let g:vimwiki_list = [{'path': 'E:/ChaoData/vimwiki/', 
\ 'path_html': 'E:/ChaoData/vimwiki/html/',
\ 'maxhi': 1}]
"\  'syntax': 'markdown',}]ʹ��markdown�����﷨

" �Ƿ������﷨�۵�  �����ļ��Ƚ���
let g:vimwiki_folding = ' '
" �������û���˵�����ǲ�����ô��Ҫ�շ�Ӣ�ĳ�Ϊά������
let g:vimwiki_camel_case = 0
 
" ���Ϊ��ɵ� checklist ��Ŀ�����ر����ɫ
let g:vimwiki_hl_cb_checked = 1
 
" �ҵ� vim ��û�в˵��ģ���һ�� vimwiki �˵���Ҳû������
let g:vimwiki_menu = ''


" �������Ԥ�� for win32
function! ViewInBrowser(name)
    let file = expand("%:p")
    exec ":update " . file
    let l:browsers = {
        \"cr":"C:/Program Files (x86)/Google/Chrome/Application/chrome.exe",
        \"ie":"C:/progra~1/intern~1/iexplore.exe"
    \}
    let htdocs='E:\\apmxe\\htdocs\\'
    let strpos = stridx(file, substitute(htdocs, '\\\\', '\', "g"))
    if strpos == -1
       exec ":silent !start ". l:browsers[a:name] ." file://" . file
    else
        let file=substitute(file, htdocs, "http://127.0.0.1:8090/", "g")
        let file=substitute(file, '\\', '/', "g")
        exec ":silent !start ". l:browsers[a:name] file
    endif
endfunction
nmap <f4>ie :call ViewInBrowser("ie")<cr>
nmap <f4>cr :call ViewInBrowser("cr")<cr>

nmap <leader>ff :call RefreshCode()<cr>
function! RefreshCode()
	let file = expand("%:p")
	exec ":silent !js-beautify -r ". file
	exec ":edit"
endfunction

colorscheme lucius
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
call pathogen#infect()
au FileType javascript set dictionary+=$VIM.'\vimfiles\bundle\vim-node\dict\node.dict'
set runtimepath^=vimfiles/bundle/ctrlp.vim
