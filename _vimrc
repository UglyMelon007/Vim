filetype plugin indent on
filetype plugin on
syntax on

"文件打开跳转上次编辑位置
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
 " 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
au InsertLeave *.* write
set nowrap
set number
set nobackup
set selection=inclusive
"设置缩进方式
set fdm=indent
"设置字符编码方式
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,cp936
set fileencoding=utf-8
set termencoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

" vimwiki
let g:vimwiki_use_mouse = 1
"存放vimwiki文件路径
"存放vimwiki转换为html网页时的保存路径
let g:vimwiki_list = [{'path': 'E:/chao_data/vimwiki/', 
\ 'path_html': 'E:/chao_data/vimwiki/html/',}]
"\  'syntax': 'markdown',}]使用markdown解析语法

" 是否开启按语法折叠  会让文件比较慢
let g:vimwiki_folding = ' '
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''


" 在浏览器预览 for win32
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
au FileType javascript set dictionary+=$VIM.'\vimfiles\dict\node.dict'
set runtimepath^=vimfiles/bundle/ctrlp.vim




