#! /bin/bash

# Based on a script by Wout Mertens and suggestions from Laurent Bihanic.
#

# try neovim first
if [ -f /usr/local/bin/nvim ]
then
  binary="/usr/local/bin/nvim"
  VIMPATH="$binary -d"
elif [[ -f /usr/local/bin/mvim ]]
then
  # fall back to mvim
  VIMPATH='/usr/local/bin/mvim -d -f'
else
  # fall back to original vim
  VIMPATH='vimdiff'
fi

$VIMPATH "$@"

