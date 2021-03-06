" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
	" Abbreviations
	abbr funciton function
	abbr teh the
	abbr tempalte template
	abbr fitler filter
	abbr cosnt const
	abbr attribtue attribute
	abbr attribuet attribute

	" improove key navigation usability
	nnoremap k kzz
	nnoremap j jzz
	nnoremap p pzz
	nnoremap P Pzz
	nnoremap G Gzz
	nnoremap x xzz
	inoremap <ESC> <ESC>zz
	nnoremap <ENTER> <ENTER>zz
	inoremap <ENTER> <ENTER><ESC>zza
	nnoremap o o<ESC>zza
	nnoremap O O<ESC>zza
	nnoremap a a<ESC>zza

	set nohidden " avoid keeping buffers in background
  set nocompatible

	" Turn Off Swap Files
	set nobackup
	set noswapfile
	set nowb
	set nowritebackup

	" autoread and autowrite
	set autoread " detect when a file is changed
	set autowrite
	set autowriteall

	" persistent-undo
	set undodir=~/.vim/undo
	set undofile

	set history=1000 " change history to 1000
	set textwidth=120

	set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
	set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

	if (has('nvim'))
		let g:python_host_prog = '/usr/local/bin/python2'
		let g:python3_host_prog = '/usr/local/bin/python3'
		" show results of substition as they're happening
		" but don't open a split
		set inccommand=nosplit
	endif

	set backspace=indent,eol,start " make backspace behave in a sane manner
	set clipboard=unnamed
  set splitright
  set splitbelow

	if has('mouse')
		set mouse=a
	endif

	" Searching
	set ignorecase " case insensitive searching
	set smartcase " case-sensitive if expresson contains a capital letter
	set hlsearch " highlight search results
	set incsearch " set incremental search, like modern browsers
	set nolazyredraw " don't redraw while executing macros

	set magic " Set magic on, for regex

	" error bells
	set noerrorbells
	set visualbell
	set t_vb=
	set tm=500

  " Autosave on lose focus
  au BufLeave * silent! wall

  " Vertical split at startup
  au VimEnter * if winwidth('%') >= 200 | vsplit | endif

  set clipboard=unnamed
" }}}

" Appearance {{{
	set nowrap
	set wrapmargin=0 " wrap lines when coming within n characters from side
	set linebreak " set soft wrapping
	set showbreak=… " show ellipsis at breaking
	set autoindent " automatically set indent of new line
	set ttyfast " faster redrawing
	set diffopt+=vertical
	set laststatus=2 " show the satus line all the time
	set so=7 " set 7 lines to the cursors - when moving vertical
	set wildmenu " enhanced command line completion
	set hidden " current buffer can be put into background
	set showcmd " show incomplete commands
	set noshowmode " don't show which mode disabled for PowerLine
	set wildmode=list:longest " complete files like a shell
	set scrolloff=3 " lines of text around cursor
	set shell=$SHELL
	set cmdheight=1 " command bar height
	set title " set terminal title
	set showmatch " show matching braces
	set mat=2 " how many tenths of a second to blink

	" Tab control
	set expandtab " insert spaces rather then tabs
	set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
	set tabstop=2 " the visible width of tabs
	set softtabstop=2 " edit as if the tabs are 4 characters wide
	set shiftwidth=2 " number of spaces to use for indent and unindent
	set shiftround " round indent to a multiple of 'shiftwidth'

	" code folding settings
	set foldmethod=syntax " fold based on indent
	set foldlevelstart=99
	set foldnestmax=10 " deepest fold is 10 levels
	set nofoldenable " don't fold by default
	set foldlevel=1

	" toggle invisible characters
	set nolist
	set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
	set showbreak=↪

  " line number
  set relativenumber

	set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
	" switch cursor to line when in insert mode, and block when not
	set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

	if &term =~ '256color'
		" disable background color erase
		set t_ut=
	endif

	" enable 24 bit color support if supported
	if (has('mac') && empty($TMUX) && has("termguicolors"))
		set termguicolors
	endif

	" highlight conflicts
	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul

	" Load colorschemes
	Plug 'chriskempson/base16-vim'
	Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'

  " Airline {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts=1
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_theme='angr'
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    " enable airline tabline
    let g:airline#extensions#tabline#enabled = 1
    " only show tabline if tabs are being used (more than 1 tab open)
    let g:airline#extensions#tabline#tab_min_count = 2
    " do not show open buffers in tabline
    let g:airline#extensions#tabline#show_buffers = 0
  " }}}
" }}}

" General Mappings {{{
	" set a map leader for more key combos
  let mapleader = '\'

  " wipout buffer
  nmap <silent> <leader>b :bw<cr>

	" shortcut to save
	nmap <leader>s :w<cr>

	" set paste toggle
	set pastetoggle=<leader>v

	" activate spell-checking alternatives
	" nmap ;s :set invspell spelllang=en<cr>

	" markdown to html
	nmap <leader>md :%!markdown --html4tags <cr>

	" remove extra whitespace
	nmap <leader><space> :%s/\s\+$<cr>
	nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

	inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

	nmap <leader>l :set list!<cr>

	" switch between current and last buffer
	nmap <leader>. <c-^>

	" enable . command in visual mode
	vnoremap . :normal .<cr>

	map <silent> <C-h> :call functions#WinMove('h')<cr>
	map <silent> <C-j> :call functions#WinMove('j')<cr>
	map <silent> <C-k> :call functions#WinMove('k')<cr>
	map <silent> <C-l> :call functions#WinMove('l')<cr>

	map <leader>wc :wincmd q<cr>

	" move line mappings
	" ∆ is <A-j> on macOS
	" ˚ is <A-k> on macOS
	nnoremap ∆ :m .+1<cr>==
	nnoremap ˚ :m .-2<cr>==
	inoremap ∆ <Esc>:m .+1<cr>==gi
	inoremap ˚ <Esc>:m .-2<cr>==gi
	vnoremap ∆ :m '>+1<cr>gv=gv
	vnoremap ˚ :m '<-2<cr>gv=gv

	vnoremap $( <esc>`>a)<esc>`<i(<esc>
	vnoremap $[ <esc>`>a]<esc>`<i[<esc>
	vnoremap ${ <esc>`>a}<esc>`<i{<esc>
	vnoremap $" <esc>`>a"<esc>`<i"<esc>
	vnoremap $' <esc>`>a'<esc>`<i'<esc>
	vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
	vnoremap $< <esc>`>a><esc>`<i<<esc>

	" toggle cursor line
	nnoremap <leader>i :set cursorline!<cr>

	" scroll the viewport faster
	nnoremap <C-e> 3<C-e>
	nnoremap <C-y> 3<C-y>

	" moving up and down work as you would expect
	nnoremap <silent> j gj
	nnoremap <silent> k gk
	nnoremap <silent> ^ g^
	nnoremap <silent> $ g$

	" helpers for dealing with other people's code
	nmap \t :set ts=4 sts=4 sw=4 noet<cr>
	nmap \s :set ts=4 sts=4 sw=4 et<cr>

	nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

	command! Rm call functions#Delete()
	command! RM call functions#Delete() <Bar> q!

	" Yank from cursor to end of line {{{
	nnoremap Y y$
  " }}}

  " Tab switch by tab key
    nmap <tab> gt
    nmap <s-tab> gT
  " }}}

" }}}

" Remap record macro key
nnoremap Q q
nnoremap q <Nop>

" AutoGroups {{{
	" file type specific settings
	augroup configgroup
		autocmd!

		" automatically resize panes on resize
		autocmd VimResized * exe 'normal! \<c-w>='
		autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
		autocmd BufWritePost .vimrc.local source %
		" save all files on focus lost, ignoring warnings about untitled buffers
		autocmd FocusLost * silent! wa

		" make quickfix windows take all the lower section of the screen
		" when there are multiple windows open
		autocmd FileType qf wincmd J
		autocmd FileType qf nmap <buffer> q :q<cr>

    " show window help on the right side
    autocmd FileType help wincmd L
	augroup END
" }}}

" General Functionality {{{
	" substitute, search, and abbreviate multiple variants of a word
	Plug 'tpope/vim-abolish'

  " search inside files using ag - The Silver Searcher
  Plug 'rking/ag.vim'

  " Make Ag searches of selected text
  Plug 'Chun-Yang/vim-action-ag'

	" insert or delete brackets, parens, quotes in pair
	Plug 'jiangmiao/auto-pairs'

	" easy commenting motions
	Plug 'tpope/vim-commentary'

	" mappings which are simply short normal mode aliases for commonly used ex commands
	Plug 'tpope/vim-unimpaired'

	" endings for html, xml, etc. - ehances surround
	Plug 'tpope/vim-ragtag'

	" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
	Plug 'tpope/vim-surround'

	" tmux integration for vim
	Plug 'benmills/vimux'

	" enables repeating other supported plugins with the . command
	Plug 'tpope/vim-repeat'

	" .editorconfig support
	Plug 'editorconfig/editorconfig-vim'

	" asynchronous build and test dispatcher
	Plug 'tpope/vim-dispatch'

	" netrw helper
	Plug 'tpope/vim-vinegar'

	" single/multi line code handler: gS - split one line into multiple,
  " gJ - combine multiple lines into one
	Plug 'AndrewRadev/splitjoin.vim'

	" extended % matching
	Plug 'vim-scripts/matchit.zip'

	" add end, endif, etc. automatically
	Plug 'tpope/vim-endwise'

	" a simple tool for presenting slides in vim based on text files
	Plug 'sotte/presenting.vim', { 'for': 'markdown' }

	" Fancy startup screen for vim {{{
  	Plug 'mhinz/vim-startify'

		" Don't change to directory when selecting a file
		let g:startify_files_number = 5
		let g:startify_change_to_dir = 0
		let g:startify_custom_header = [ ]
		let g:startify_relative_path = 1
		let g:startify_use_env = 1

		function! s:list_commits()
			let git = 'git -C ' . getcwd()
			let commits = systemlist(git . ' log --oneline | head -n5')
			let git = 'G' . git[1:]
			return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
		endfunction

		" Custom startup list, only show MRU from current directory/project
		let g:startify_lists = [
		\  { 'type': 'dir',		  'header': [ 'Files '. getcwd() ] },
		\  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
		\  { 'type': 'sessions',  'header': [ 'Sessions' ]		 },
		\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]		 },
		\  { 'type': 'commands',  'header': [ 'Commands' ]		 },
		\ ]

		let g:startify_commands = [
		\	{ 'up': [ 'Update Plugins', ':PlugUpdate' ] },
		\	{ 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
		\ ]

		let g:startify_bookmarks = [
			\ { 'c': '~/code/dotfiles/config/nvim/init.vim' },
			\ { 'z': '~/code/dotfiles/zsh/zshrc.symlink' }
		\ ]

		autocmd User Startified setlocal cursorline
	" }}}

	" Open selection in carbon.now.sh
	Plug 'kristijanhusak/vim-carbon-now-sh'

	" Close buffers but keep splits
	Plug 'moll/vim-bbye'
	nmap <leader>b :Bdelete<cr>

	" Writing in vim {{{{
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/goyo.vim'
		let g:limelight_conceal_ctermfg = 240

        let g:goyo_entered = 0
		function! s:goyo_enter()
			silent !tmux set status off
            let g:goyo_entered = 1
			set noshowmode
			set noshowcmd
			set scrolloff=999
			Limelight
		endfunction

		function! s:goyo_leave()
			silent !tmux set status on
            let g:goyo_entered = 0
			set showmode
			set showcmd
			set scrolloff=5
			Limelight!
		endfunction

		autocmd! User GoyoEnter nested call <SID>goyo_enter()
		autocmd! User GoyoLeave nested call <SID>goyo_leave()
	" }}}

	" context-aware pasting
	Plug 'sickill/vim-pasta'

	" NERDTree {{{
		Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
		Plug 'Xuyuanp/nerdtree-git-plugin'
		Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

		" Toggle NERDTree
		function! ToggleNerdTree()
			if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
				:NERDTreeFind
			else
				:NERDTreeToggle
			endif
		endfunction
		" toggle nerd tree
		nmap <silent> <leader>k :call ToggleNerdTree()<cr>
		" find the current file in nerdtree without needing to reload the drawer
		nmap <silent> <leader>y :NERDTreeFind<cr>

		let NERDTreeShowHidden=1
		" let NERDTreeDirArrowExpandable = '▷'
		" let NERDTreeDirArrowCollapsible = '▼'
		let g:NERDTreeIndicatorMapCustom = {
		\ "Modified"  : "✹",
		\ "Staged"	  : "✚",
		\ "Untracked" : "✭",
		\ "Renamed"   : "➜",
		\ "Unmerged"  : "═",
		\ "Deleted"   : "✖",
		\ "Dirty"	  : "✗",
		\ "Clean"	  : "✔︎",
		\ 'Ignored'   : '☒',
		\ "Unknown"   : "?"
		\ }
	" }}}

	" FZF {{{
		Plug '/usr/local/opt/fzf'
		Plug 'junegunn/fzf.vim'
		let g:fzf_layout = { 'window': 'enew' }

		if isdirectory(".git")
			" if in a git project, use :GFiles
			nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
		else
			" otherwise, use :FZF
			nmap <silent> <leader>t :FZF<cr>
		endif

		nmap <silent> <leader>g :GFiles?<cr>

		nmap <silent> <leader>r :Buffers<cr>
		nmap <silent> <nowait> <leader>e :FZF<cr>
		nmap <leader><tab> <plug>(fzf-maps-n)
		xmap <leader><tab> <plug>(fzf-maps-x)
		omap <leader><tab> <plug>(fzf-maps-o)

		" Insert mode completion
		imap <c-x><c-k> <plug>(fzf-complete-word)
		imap <c-x><c-f> <plug>(fzf-complete-path)
		imap <c-x><c-j> <plug>(fzf-complete-file-ag)
		imap <c-x><c-l> <plug>(fzf-complete-line)

		nnoremap <silent> <Leader>c :call fzf#run({
		\	'source':
		\	  map(split(globpath(&rtp, "colors/*.vim"), "\n"),
		\		  "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
		\	'sink':    'colo',
		\	'options': '+m',
		\	'left':    35
		\ })<CR>

		command! FZFMru call fzf#run({
		\  'source':  v:oldfiles,
		\  'sink':	  'e',
		\  'options': '-m -x +s',
		\  'right':	  '40%'})

		command! -bang -nargs=* Find call fzf#vim#grep(
			\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
			\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
		command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
		command! -bang -nargs=? -complete=dir GitFiles
			\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

    " Open files in horizontal split
    nnoremap <silent> <Leader>s :call fzf#run({
    \   'down': '40%',
    \   'sink': 'botright split' })<CR>

    " Open files in vertical horizontal split
    nnoremap <silent> <Leader>v :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'vertical botright split' })<CR>

	" }}}

	" vim-fugitive {{{
		Plug 'tpope/vim-fugitive'
		Plug 'tpope/vim-rhubarb' " hub extension for fugitive
    Plug 'junegunn/gv.vim'
    Plug 'sodapopcan/vim-twiggy'
    Plug 'christoomey/vim-conflicted'
		nmap <silent> <leader>gs :Gstatus<cr>
		nmap <leader>ge :Gedit<cr>
		nmap <silent><leader>gr :Gread<cr>
		nmap <silent><leader>gb :Gblame<cr>
	" }}}

	" UltiSnips {{{
		Plug 'SirVer/ultisnips' " Snippets plugin
    Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<c-i>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	" }}}

  " Deoplete {{{
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
  " }}}


  " Custom search {{{

    " Incsearch {{{
      Plug 'haya14busa/is.vim'
    " }}}

    Plug 'justinmk/vim-sneak'
  " }}}

" }}}

" Language-Specific Configuration {{{
  Plug 'sheerun/vim-polyglot'
" }}}

  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
  let g:ranger_replace_netrw = 1
  let g:ranger_map_keys = 0
  nmap = :Ranger<CR>

	Plug 'timcharper/textile.vim', { 'for': 'textile' }
	Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
	Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }

" }}}

call plug#end()

" Colorscheme and final setup {{{
	" This call must happen after the plug#end() call to ensure
	" that the colorschemes have been loaded
	if filereadable(expand("~/.vimrc_background"))
		let base16colorspace=256
		source ~/.vimrc_background
	else
		let g:onedark_termcolors=16
		let g:onedark_terminal_italics=1
		colorscheme onedark
	endif
	syntax on
	filetype plugin indent on
	" make the highlighting of tabs and other non-text less annoying
	highlight SpecialKey ctermfg=236
	highlight NonText ctermfg=236

	" make comments and HTML attributes italic
	highlight Comment cterm=italic
	highlight htmlArg cterm=italic
	highlight xmlAttrib cterm=italic
	highlight Type cterm=italic
	highlight Normal ctermbg=none

" }}}

" vim:set foldmethod=marker foldlevel=0
