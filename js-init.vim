call plug#begin('~/AppData/Local/nvim/plugged')
"below are some vim plugin for demonstration purpose
 " Plug 'joshdick/onedark.vim'
 Plug 'tomasiser/vim-code-dark'
 Plug 'iCyMind/NeoSolarized'

 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'yegappan/taglist'
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'neoclide/coc-prettier'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
   Plug 'tpope/vim-commentary'
   Plug 'bkad/CamelCaseMotion'
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'pseewald/anyfold'
 call plug#end()
  
  let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
let g:python3_host_prog='c:\\python38\\python'  
  "prettier
  let g:coc_global_extensions += ['coc-prettier']
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" TextEdit might fail if hidden is not set.
set hidden
" let g:onedark_termcolors=256
" colorscheme onedark
set t_Co=256
set t_ut=
colorscheme codedark
let g:airline_theme = 'codedark'
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
let g:airline_section_x=''
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_section_b=''
let g:airline_skip_empty_sections = 1
  let g:airline#extensions#fugitiveline#enabled = 1
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
let g:camelcasemotion_key = '<leader>'

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap<leader>tn :tabn<cr>
nnoremap<leader>tl :tabl<cr>
nnoremap<leader>tp :tabp<cr>
nnoremap<leader>tr :tabr<cr>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" turn relative line numbers on
:set relativenumber
:set nu rnu
" Use <C-l> for trigger snippet expand.
 imap <C-l> <Plug>(coc-snippets-expand)

 " Use <C-j> for select text for visual placeholder of snippet.
 vmap <C-j> <Plug>(coc-snippets-select)

 " Use <C-j> for jump to next placeholder, it's default of coc.nvim
 let g:coc_snippet_next = '<c-j>'

 " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
 let g:coc_snippet_prev = '<c-k>'

 " Use <C-j> for both expand and jump (make expand higher priority.)
 imap <C-j> <Plug>(coc-snippets-expand-jump)
 
" You can set up fzf window using a Vim command (Neovim or latest Vim 8
" required)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-o': 'vsplit' }"
" " Customize fzf colors to match your color scheme
" " - fzf#wrap translates this to a set of `--color` options
 let g:fzf_colors = { 'fg':      ['fg', 'Normal'], 'bg':      ['bg', 'Normal'], 'hl':      ['fg', 'Comment'], 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],'hl+':     ['fg', 'Statement'], 'info':    ['fg', 'PreProc'], 'border':  ['fg', 'Ignore'], 'prompt':  ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header':  ['fg', 'Comment'] }
"
"                         " Enable per-command history
"                         " - History files will be stored in the specified
"                         directory
"                         " - When set, CTRL-N and CTRL-P will be bound to
"                         'next-history' and
"                         "   'previous-history' instead of 'down' and 'up'.
"                         let g:fzf_history_dir = '~/.local/share/fzf-history'
if has('nvim') && !exists('g:fzf_layout')
	  autocmd! FileType fzf
	    autocmd  FileType fzf set laststatus=0 noshowmode noruler
	        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    endif
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :Files<Cr>

nnoremap<leader>s :w<cr>
nnoremap<leader>x :wq<cr>
nnoremap<leader>q :q!<cr>
nnoremap<leader>xa :wqa<cr>
filetype plugin indent on " required
 syntax on                 " required

  autocmd Filetype * AnyFoldActivate               " activate for all filetypes
  set foldlevel=0  " close all folds
  let g:rainbow_active = 1
  set ignorecase 
  set smartcase
  let g:sneak#label = 1
  nnoremap <leader>n :NERDTreeToggle<CR>
