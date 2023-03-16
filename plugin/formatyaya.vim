if exists('g:loaded_formatyaya')
  finish
endif
let g:loaded_formatyaya = 1

if !exists('g:formatyaya_option')
  let g:formatyaya_option = '-s -c 2'
endif

command! FmtYaya call formatyaya#paste(formatyaya#format(formatyaya#copytotmp()))
