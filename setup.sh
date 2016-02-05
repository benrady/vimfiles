#!/usr/bin/env sh

abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
vim_dir=`dirname $abspath`
cd $vim_dir

function fetch_repo {
  local url=$1
  local repo=${1##*/}
  local name=${repo%.git}
  if [[ -d bundle/$name ]]; then
    pushd bundle/$name
    git pull $url master
    popd
  else
    git clone $url bundle/$name
  fi
}

# CTRL-P and its dependencies
fetch_repo https://github.com/MarcWeber/vim-addon-mw-utils.git

# Create HTML using css expressions
fetch_repo https://github.com/rstacruz/sparkup.git
pushd bundle/sparkup
make vim-pathogen
popd

# Snippets, highlighting and file type detection for RSpec
fetch_repo https://github.com/vim-scripts/Specky.git

# Clojure repl goodness
fetch_repo git://github.com/tpope/vim-salve.git
fetch_repo git://github.com/tpope/vim-projectionist.git
fetch_repo git://github.com/tpope/vim-dispatch.git
fetch_repo git://github.com/tpope/vim-fireplace.git

# Clojure rainbow parens
fetch_repo https://github.com/kien/rainbow_parentheses.vim.git

# Snippets for many languages (hit tab)
fetch_repo https://github.com/kien/ctrlp.vim.git
fetch_repo https://github.com/tomtom/tlib_vim.git
fetch_repo https://github.com/garbas/vim-snipmate.git
fetch_repo https://github.com/honza/vim-snippets.git # Has the actual snippet files

# Automatically add block endings for ruby
fetch_repo https://github.com/tpope/vim-endwise.git

# Easily change parenthesis, brackets, quotes, etc...
#fetch_repo git://github.com/tpope/vim-surround.git

# An older version is included with vim. We want the newest.
fetch_repo https://github.com/vim-ruby/vim-ruby.git

# Vim has basic JavaScript support, but this might be better
fetch_repo https://github.com/pangloss/vim-javascript.git

# Git commands from vim using :Gxxx
fetch_repo https://github.com/tpope/vim-fugitive.git

# Manipulate surround parens
fetch_repo git://github.com/tpope/vim-surround.git

# PML support for vim
fetch_repo https://github.com/nelstrom/vim-pml.git

# PyDoc support
fetch_repo https://github.com/fs111/pydoc.vim

