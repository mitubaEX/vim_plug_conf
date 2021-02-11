" rspec script
function! s:toggleRspecFile() abort
	let current_dir = expand('%:r')
  let basename = @%
  let filename = expand('%:t')
  if current_dir =~ 'spec'
    execute 'e ' . substitute(substitute(basename, filename, '', 'g'), 'spec', 'app', 'g') . substitute(filename, '_spec.rb', '', 'g') . '.rb'
  else
    execute 'e ' . substitute(substitute(basename, filename, '', 'g'), 'app', 'spec', 'g') . substitute(filename, '.rb', '', 'g') . '_spec.rb'
  endif
endfunction
command! -nargs=* ToggleRspecFile call s:toggleRspecFile()
" vim-rspec
nmap <Leader>x :ToggleRspecFile<CR>

" Require fugitive and .
" When open blame buffer of fugitive,
" execute command.
function! s:openCurrentBlameFile() abort
  let current_absolute_path = expand('%:p')
  if current_absolute_path =~ 'fugitive' || (exists('g:loaded_openbrowser') && g:loaded_openbrowser)
    let current_filehash = expand('%:t')
    let splited_filepath = split(expand('%:r'), '/')
    let owner_name = splited_filepath[-5]
    let repo_name = splited_filepath[-4]

    " get git remote path (origin or upstream)
    let git_remote_path = substitute(system("git remote -v | grep $(git remote | tail -1) | awk '{print $2}' | uniq | cut -d '/' -f 4,5 | sed 's/.git//g'"), '\n', '', 'g')
    let joined_path = join([git_remote_path, 'commit', current_filehash], '/')

    let open_url = 'https://github.com/' . joined_path

    if exists('g:loaded_openbrowser') && g:loaded_openbrowser
      execute 'OpenBrowser ' . open_url
    endif
  endif
endfunction
command! -nargs=* OpenCurrentBlameFile call s:openCurrentBlameFile()
nmap <Leader>b :OpenCurrentBlameFile<CR>

function! s:fillEmoji() abort
  for e in emoji#list()
    call append(line('$'), printf('%s (%s)', emoji#for(e), e))
  endfor
endfunction

command! -nargs=* FillEmoji call s:fillEmoji()
