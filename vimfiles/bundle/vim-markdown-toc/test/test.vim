exec "silent! source " . "../ftplugin/markdown.vim"

let g:caseCount = 0
let g:passCaseCount = 0
let g:errorCaseCount = 0

function! ASSERT(var)
    let g:caseCount += 1
    if a:var != 0
        let g:passCaseCount += 1
        echo "case " . g:caseCount . " pass"
    else
        let g:errorCaseCount += 1
        echoe "case " . g:caseCount . " error"
    endif
endfunction

let g:GFMHeadingIds = {}

" GFM Test Cases
call ASSERT(GetHeadingLinkTest("# 你好！", "GFM") ==# "你好")
call ASSERT(GetHeadingLinkTest("## Hello World", "GFM") ==# "hello-world")
call ASSERT(GetHeadingLinkTest("### Hello World", "GFM") ==# "hello-world-1")
call ASSERT(GetHeadingLinkTest("#### `Hello World`", "GFM") ==# "hello-world-2")
call ASSERT(GetHeadingLinkTest("##### _Hello_World_", "GFM") ==# "hello_world")
call ASSERT(GetHeadingLinkTest("###### ,", "GFM") ==# "")
call ASSERT(GetHeadingLinkTest("# ,", "GFM") ==# "-1")
call ASSERT(GetHeadingLinkTest("## No additional spaces before / after punctuation in fullwidth form", "GFM") ==# "no-additional-spaces-before--after-punctuation-in-fullwidth-form")
call ASSERT(GetHeadingLinkTest("### No additional spaces before/after punctuation in fullwidth form", "GFM") ==# "no-additional-spaces-beforeafter-punctuation-in-fullwidth-form")
call ASSERT(GetHeadingLinkTest("####   Hello    Markdown    ", "GFM") ==# "hello----markdown")
call ASSERT(GetHeadingLinkTest("####Heading without a space after the hashes", "GFM") ==# "heading-without-a-space-after-the-hashes")
call ASSERT(GetHeadingLinkTest("### heading with trailing hashes ###", "GFM") ==# "heading-with-trailing-hashes")
call ASSERT(GetHeadingLinkTest("### heading with trailing hashes###", "GFM") ==# "heading-with-trailing-hashes-1")
call ASSERT(GetHeadingLinkTest("### heading with trailing hashes ends with spaces ###  ", "GFM") ==# "heading-with-trailing-hashes-ends-with-spaces-")
call ASSERT(GetHeadingLinkTest("### heading with trailing hashes nested with spaces # #  #  ", "GFM") ==# "heading-with-trailing-hashes-nested-with-spaces----")
call ASSERT(GetHeadingLinkTest("### [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)", "GFM") ==# "vim-markdown-toc")
call ASSERT(GetHeadingLinkTest("### [vim-markdown-toc-again][1]", "GFM") ==# "vim-markdown-toc-again")
call ASSERT(GetHeadingLinkTest("### ![vim-markdown-toc-img](/path/to/a/png)", "GFM") ==# "vim-markdown-toc-img")
call ASSERT(GetHeadingLinkTest("### ![](/path/to/a/png)", "GFM") ==# "-2")

" Redcarpet Test Cases
call ASSERT(GetHeadingLinkTest("# -Hello-World-", "Redcarpet") ==# "hello-world")
call ASSERT(GetHeadingLinkTest("## _Hello_World_", "Redcarpet") ==# "hello_world")
call ASSERT(GetHeadingLinkTest("### (Hello()World)", "Redcarpet") ==# "hello-world")
call ASSERT(GetHeadingLinkTest("#### 让 Discuz! 局域网内可访问", "Redcarpet") ==# "让-discuz-局域网内可访问")
call ASSERT(GetHeadingLinkTest('##### "你好"世界"', "Redcarpet") ==# "quot-你好-quot-世界-quot")
call ASSERT(GetHeadingLinkTest("###### '你好'世界'", "Redcarpet") ==# "39-你好-39-世界-39")
call ASSERT(GetHeadingLinkTest("# &你好&世界&", "Redcarpet") ==# "amp-你好-amp-世界-amp")
call ASSERT(GetHeadingLinkTest("## `-ms-text-autospace` to the rescue?", "Redcarpet") ==# "ms-text-autospace-to-the-rescue")

echo "" . g:passCaseCount . " cases pass, " . g:errorCaseCount . " cases error"
