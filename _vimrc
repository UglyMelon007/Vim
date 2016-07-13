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
"����������ʽ
set fdm=indent
"�ر��ļ����Զ��۵�
set foldlevel=9999
"�����ַ����뷽ʽ
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,cp936
set fileencoding=utf-8
set termencoding=utf-8
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
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8
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
