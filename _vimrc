filetype plugin indent on
filetype plugin on
filetype on
syntax on

"文件打开跳转上次编辑位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"自动进入文件所在目录
set autochdir
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
set autoindent
"set guifont=Monaco:h10
set guifont=Consolas_for_Powerline_FixedD:h12:cANSI:qDRAFT
set cursorline
set guioptions-=T 
set guioptions-=m
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set number
"设置相对行号
set relativenumber
"不生成备份文件
set noundofile
set nobackup
set noswapfile

set selection=inclusive
colorscheme lucius
"设置缩进方式
set fdm=indent
"关闭 文件打开自动折叠
set foldlevel=9999
"禁用markdown文件折叠
let g:vim_markdown_folding_disabled = 1
"自动保存文件
au InsertLeave *.* write
"设置字符编码方式
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk2312,gbk,gb18030,cp936,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
"打开文件所在文件夹
nnoremap <Leader>of :silent !explorer \%cd\% <CR>
"在文件所在目录打开控制台
nnoremap <Leader>oc :silent !start<CR>


"如果打开R文件，则设置窗口大小及位置
autocmd BufNewFile,BufRead *.r call SetWindowLocation()
function! SetWindowLocation()
	winpos 0 0
	set lines=17 columns=156
endfunction

"vim-grepper
nnoremap <Leader>ft :Grepper<Cr>

"ctrlp
set wildignore+=*.o,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,*~,*.pyc,*_build/*,*/converage/*,*.mo,*.po,*.so
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|.pyc|DS_Store|(\.(swp|ico|git|svn))'
"使用了ag去替换默认的搜索功能grep
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"是否自动打开关闭错误列表 0 不自动打开或关闭 1自动打开关闭 2自动关闭不自动打开
"3自动打开不自动关闭
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
nnoremap <Leader>p :lprevious <CR>
nnoremap <Leader>n :lnext <CR>

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
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"vim-airline
set laststatus=2
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
set statusline+=%{fugitive#statusline()} "  Git Hotness

" 设置NerdTree
map <silent> <F3> :NERDTreeMirror<CR>
map <silent> <F3> :NERDTreeToggle<CR>

"Ctags
map <silent> <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

"taglist废弃不用 使用tagbar
"map <F4> :TlistToggle<CR>
"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

"tagbar
map <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=1
"支持markdown
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
"支持css
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
"支持R
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" vimwiki
let g:vimwiki_use_mouse = 1
nmap <leader>tt <Plug>VimwikiToggleListItem
"存放vimwiki文件路径
"存放vimwiki转换为html网页时的保存路径
let g:vimwiki_list = [{'path': 'E:/ChaoData/vimwiki/', 
\ 'path_html': 'E:/ChaoData/vimwiki/html/',
\ 'maxhi': 1}]

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

"美化各类文档（利用js-beautify)
nmap <leader>ff :call RefreshCode()<cr>
function! RefreshCode()
	let file = expand("%:p")
	exec ":silent !js-beautify -r ". file
	exec ":edit"
endfunction

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

"CtrlP
set runtimepath^=vimfiles/bundle/ctrlp.vim
