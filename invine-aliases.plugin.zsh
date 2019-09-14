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

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# tldr for Android
if [ $(uname -o) '==' 'Android' ];
then
    export TLDR_OS=linux
fi
