#!/bin/bash

# list branches verbose
alias gbavv='git branch -vva'

# commit history short /w signed commit
alias glg='git log --pretty="format:%h %G? %aN  %s"'

# commit history more details
alias glgLong="git log --stat"

# list all tracked files in repo
alias gitLsTracked="git ls-tree --full-tree -r --name-only HEAD"

# list untracked files in repo
alias gitLsUntracked="git ls-files . --exclude-standard --others"

# what commit added file?
alias gitWhatAdded="git log --follow --diff-filter=A"

# view last version of file
alias gitLastVersion='f(){ git show HEAD~1:$1};f'
