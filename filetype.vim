
		augroup filetypedetect
			au! BufRead,BufNewFile *.rhtml		setfiletype eruby
      " Flex Development
      au BufNewFile,BufRead *.mxml       setfiletype mxml
      au BufNewFile,BufRead *.as           setfiletype actionscript
    augroup END

