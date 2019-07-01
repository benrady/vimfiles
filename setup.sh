#!/bin/bash

abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
vim_dir=`dirname $abspath`
cd $vim_dir

mkdir $vim_dir/undodir

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
    git clone --recursive $url bundle/$name
  fi
}

# Sensible default settings
fetch_repo git://github.com/tpope/vim-sensible.git

# Airline status bar
fetch_repo git://github.com/vim-airline/vim-airline.git

# CTRL-P and its dependencies
fetch_repo https://github.com/MarcWeber/vim-addon-mw-utils.git
fetch_repo https://github.com/ctrlpvim/ctrlp.vim

# Rust dependencies
fetch_repo https://github.com/rust-lang/rust.vim.git
fetch_repo https://github.com/rhysd/rust-doc.vim

# Create HTML using css expressions
fetch_repo https://github.com/rstacruz/sparkup.git
pushd bundle/sparkup
make vim-pathogen
popd

# Clojure repl goodness
fetch_repo git://github.com/tpope/vim-salve.git
fetch_repo git://github.com/tpope/vim-projectionist.git
fetch_repo git://github.com/tpope/vim-dispatch.git
fetch_repo git://github.com/tpope/vim-fireplace.git

# Vim Jedi
fetch_repo https://github.com/davidhalter/jedi-vim.git

#e Other clojure goodies
fetch_repo https://github.com/eapache/rainbow_parentheses.vim.git
fetch_repo https://github.com/guns/vim-clojure-static.git 

# Snippets for many languages (hit tab)
fetch_repo https://github.com/tomtom/tlib_vim.git
fetch_repo https://github.com/garbas/vim-snipmate.git

# Automatically add block endings for ruby
fetch_repo https://github.com/tpope/vim-endwise.git

# An older version is included with vim. We want the newest.
fetch_repo https://github.com/vim-ruby/vim-ruby.git

# Vim has basic JavaScript support, but this might be better
fetch_repo https://github.com/pangloss/vim-javascript.git

# Git commands from vim using :Gxxx
fetch_repo https://github.com/tpope/vim-fugitive.git

# PyDoc support
fetch_repo https://github.com/fs111/pydoc.vim
