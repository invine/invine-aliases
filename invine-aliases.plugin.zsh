if [ -e source-highlight-esc.sh ]
then
    export LESSOPEN="| source-highlight-esc.sh %s"
    export LESS='-R '
fi
export GREP_COLORS="mt=01;33"
export EDITOR="vim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
alias nn='nano -w'
alias snn='sudo nano -w'
alias svim='sudo vim'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias vimrc='${=EDITOR} ~/.vimrc'

# source /usr/share/doc/pkgfile/command-not-found.zsh

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
