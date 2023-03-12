if exists('g:loaded_formatyaya')
  finish
endif
let g:loaded_formatyaya = 1

command! FmtYaya call formatyaya#paste(formatyaya#format(formatyaya#copytotmp()))
