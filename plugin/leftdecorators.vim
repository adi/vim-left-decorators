
fu! leftdecorators#disable() abort
	bufdo set norelativenumber
	bufdo set nonumber
	set signcolumn=no
	let w:left_decorators_active = 0
endfu

fu! leftdecorators#enable() abort
	bufdo set relativenumber
	bufdo set number
	set signcolumn=yes
	let w:left_decorators_active = 1
endfu

fu! leftdecorators#toogle() abort
	if !exists("w:left_decorators_active")
		let w:left_decorators_active = 1
	endif
	if w:left_decorators_active == 1
		call leftdecorators#disable()
	else
		call leftdecorators#enable()
	endif
endfu

augroup leftdecorationsgroup
	au VimEnter * call leftdecorators#enable()
augroup END

nnoremap <leader>l :call leftdecorators#toogle()<CR>

