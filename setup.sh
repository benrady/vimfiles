#!/bin/bash

abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
vim_dir=`dirname $abspath`
cd $vim_dir

if [[ ! -e ~/.vimrc ]]; then
  ln -s $vim_dir/.vimrc ~/.vimrc
fi

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
if [[ ! -e $XDG_CONFIG_HOME/nvim ]]; then
  ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi

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

# Sensible default settings
fetch_repo git@github.com:tpope/vim-sensible.git

# Solarized color scheme
fetch_repo git://github.com/altercation/vim-colors-solarized.git

# Airline status bar
fetch_repo git@github.com:vim-airline/vim-airline.git

# CTRL-P and its dependencies
fetch_repo https://github.com/MarcWeber/vim-addon-mw-utils.git
fetch_repo https://github.com/ctrlpvim/ctrlp.vim

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

# Other clojure goodies
fetch_repo https://github.com/kien/rainbow_parentheses.vim.git
fetch_repo https://github.com/guns/vim-clojure-static.git 

# Snippets for many languages (hit tab)
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

