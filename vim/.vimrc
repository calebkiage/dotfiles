" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vim/.vimrc.before if it exists.
if filereadable(expand("~/.vim/.vimrc.before"))
  source ~/.vim/.vimrc.before
endif


for rcfile in split(globpath("~/.vim", "*.vim"), '\n') 
    execute('source '.rcfile)
endfor

