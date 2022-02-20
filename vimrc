"=============================================================================
" vimrc --- Entry file for vim
" Copyright (c) 2016-2021 Shidong Wang & Contributors
" Author: Shidong Wang < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" Note: Skip initialization for vim-tiny or vim-small.
if 1
    let g:_spacevim_if_lua = 0
    if has('lua')
        if has('win16') || has('win32') || has('win64')
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'\lua'
            let s:str = s:plugin_dir . '\?.lua;' . s:plugin_dir . '\?\init.lua;'
        else
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'/lua'
            let s:str = s:plugin_dir . '/?.lua;' . s:plugin_dir . '/?/init.lua;'
        endif
        silent! lua package.path=vim.eval("s:str") .. package.path
        if empty(v:errmsg)
            let g:_spacevim_if_lua = 1
        endif
    endif
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
endif
" vim:set et sw=2

"call plug#begin('~/.vim/plugged')

"Plug 'SumirVats2003/color'
"Plug 'jiangmiao/auto-pairs'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'mhinz/vim-startify'
"Plug 'yunlingz/ci_dark'
"Plug 'luochen1990/rainbow'
"Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'

"call plug#end()


map <c-x> :Startify<CR>
map <c-n> :NERDTree<CR>
map <c-l> :vertical resize +5<CR>
map <c-h> :vertical resize -5<CR>
map <c-k> :res +5<CR>
map <c-j> :res -5<CR>

"let g:startify_custom_header = [
"	\ '',
"	\ '  _________              __         ____   ____       __',
"	\ ' /   _____/__ __  _____ |__|______  \   \ /   /____ _/  |_  ______',
"	\ ' \_____  \|  |  \/     \|  \_  __ \  \   Y   /\__  \\   __\/  ___/',
"	\ ' /        \  |  /  Y Y  \  ||  | \/   \     /  / __ \|  |  \___ \',
"	\ '/_______  /____/|__|_|  /__||__|       \___/  (____  /__| /____  >',
"	\ '        \/            \/                           \/          \/',
"	\ '',
"	\ ]
"
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
	\ { 'v': '~/.vim/vimrc' },
	\ { 's': '~/.SpaceVim/autoload/SpaceVim.vim' },
    \ { 'i': '~/.SpaceVim.d/init.toml'},
    \ { 'b': '~/.bashrc'}
	\ ]


" let g:spacevim_statusline_right_sections = ['fileformat', 'cursorpos', 'percentage', 'version control info']
let g:airline_powerline_fonts = 1
let g:airline_theme='behelit'
" colorscheme kiss
colo SpaceVim 
set tabstop=4
set shiftwidth=4
set nu rnu
" set cursorline
set noerrorbells
set clipboard=unnamed
syntax on
set ruler
set autoindent
set showcmd
set wildmenu
set termguicolors
set encoding=utf8

augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <c-z> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype c nnoremap <c-z> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype java nnoremap <c-z> :w <bar> !javac % && java %:r <cr>
    autocmd filetype cpp nnoremap <c-b> i#include<iostream><cr>using namespace std;<cr><cr>int main() {<cr>return 0;<cr>}<esc>kO<esc>:w<cr>
augroup END

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

