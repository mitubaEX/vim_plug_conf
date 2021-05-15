" rspec script
function! s:toggleRspecFile() abort
	let current_dir = expand('%:r')
  let basename = @%
  let filename = expand('%:t')
  if current_dir =~ 'spec'
    if current_dir =~ 'requests'
      execute 'e ' . substitute(substitute(substitute(basename, 'requests', 'controllers', 'g'), filename, '', 'g'), 'spec', 'app', 'g') . substitute(filename, '_spec.rb', '', 'g') . '.rb'
    else
      execute 'e ' . substitute(substitute(basename, filename, '', 'g'), 'spec', 'app', 'g') . substitute(filename, '_spec.rb', '', 'g') . '.rb'
    endif
  else
    if current_dir =~ 'controllers'
      execute 'e ' . substitute(substitute(substitute(basename, 'controllers', 'requests', 'g'), filename, '', 'g'), 'app', 'spec', 'g') . substitute(filename, '.rb', '', 'g') . '_spec.rb'
    else
      execute 'e ' . substitute(substitute(basename, filename, '', 'g'), 'app', 'spec', 'g') . substitute(filename, '.rb', '', 'g') . '_spec.rb'
    endif
  endif
endfunction
command! -nargs=* ToggleRspecFile call s:toggleRspecFile()
" vim-rspec
nmap <Leader>x :ToggleRspecFile<CR>

function! s:fillEmoji() abort
  for e in emoji#list()
    call append(line('$'), printf('%s (%s)', emoji#for(e), e))
  endfor
endfunction

command! -nargs=* FillEmoji call s:fillEmoji()
