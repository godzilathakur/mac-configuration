set autochdir
set tags=tags;
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set number
set hlsearch
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
set shiftwidth=4
set cindent 

set nocompatible
filetype off

" configure plugins:
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'fatih/vim-go'
 Plugin 'prettier/vim-prettier'
 Plugin 'scrooloose/nerdtree'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 call vundle#end()
 filetype plugin indent on

" make editing a little nicer:
 syntax on
 set hidden
 set number
 set incsearch
 set hlsearch
 set ruler

" configure go:
 let g:go_fmt_command = "goimports"
 autocmd FileType go setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2|setlocal noexpandtab
 autocmd FileType go compiler go
 autocmd FileType go nmap gd <Plug>(go-def)
 autocmd FileType go nmap <leader>b  <Plug>(go-build)
 autocmd FileType go nmap <leader>r  <Plug>(go-run)
 let g:go_list_type = "quickfix"

" optional go syntax highlighting options
 let g:go_highlight_extra_types = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_function_arguments = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_variable_declarations = 1
 let g:go_highlight_variable_assignments = 1

" autocomplete:
 set completeopt=menuone

" prettier autosave
 let g:prettier#autoformat = 0
 autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md Prettier
 
" Nerdtree 
 autocmd vimenter * NERDTree
 map <C-n> :NERDTreeToggle<CR>
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 let g:NERDTreeIndicatorMapCustom = {
     \ "Modified"  : "✹",
     \ "Staged"    : "✚",
     \ "Untracked" : "✭",
     \ "Renamed"   : "➜",
     \ "Unmerged"  : "═",
     \ "Deleted"   : "✖",
     \ "Dirty"     : "✗",
     \ "Clean"     : "✔︎",
     \ 'Ignored'   : '☒',
     \ "Unknown"   : "?"
     \ }

" Key Bindings
 map <C-t><up> :tabr<cr>
 map <C-t><down> :tabl<cr>
 map <C-t><left> :tabp<cr>
 map <C-t><right> :tabn<cr>
 nnoremap <leader>a :cclose<CR>
