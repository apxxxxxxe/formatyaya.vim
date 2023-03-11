if exists('g:formatyaya_loaded')
  finish
endif
let g:formatyaya_loaded = 1

let s:sep = fnamemodify('.', ':p')[-1:]
let s:cmd_dir = expand('<script>:p:h:h') .. s:sep .. 'cmd'

function! formatyaya#copytotmp()
  let s:lines = getline(0,line('$'))
  let s:tmp = tempname() .. '.dic'
  call writefile(s:lines, s:tmp)
  return s:tmp
endfunction

function! formatyaya#format(file)
  if has('win32')
    let l:cmd = 'formatyaya_windows_amd64.exe'
  else
    let l:cmd = 'formatyaya_linux_amd64'
  endif
  let s:result = system(s:cmd_dir .. s:sep .. l:cmd .. ' -s ' .. expand(a:file, ':p'))
  return s:result
endfunction

function! formatyaya#paste(lines)
  let l:pos = getpos('.')
  execute '0,' .. line('$') .. 'd'
  put =a:lines
  0d
  call setpos('.', l:pos)
endfunction

command! FmtYaya call formatyaya#paste(formatyaya#format(formatyaya#copytotmp()))
