if [ -e source-highlight-esc.sh ]
then
    export LESSOPEN="| source-highlight-esc.sh %s"
    export LESS='-R '
fi

export GREP_COLORS="mt=01;33"
export EDITOR="nvim"

if [ -e /usr/bin/lsd ]
then
    alias ls='lsd'
    alias la='lsd -laFh'
else
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
alias svim='sudo vim'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias vimrc='${=EDITOR} ~/.config/nvim/init.vim'
alias vim=nvim
alias help=tldr

# fix home, delete and return bindings
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char

# bind jj to ESC
bindkey "jj" vi-cmd-mode

# tldr for Android
if [ $(uname -o) '==' 'Android' ];
then
    export TLDR_OS=linux
fi
