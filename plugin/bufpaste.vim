if !has('python3')
    finish
endi

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/bufpaste.py'

imap <Leader>ip <C-R>=PasteImageBuffer()<C-M>

" prompt user for input
function! PasteImageBuffer()
"paste the contents
    let image_name = ""

    call inputsave()
    let name = input('Enter image name: ')
    call inputrestore()

    if name == ""
        throw "Need a valid image name"
    endi

    " execute 'pyfile '. s:path
    execute 'py3file '. s:path
    return  '!['. name . '](' . image_name . ' "'. name . '")'
endfunc

"command! PIB call PasteImageBuffer()
