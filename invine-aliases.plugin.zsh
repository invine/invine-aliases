if [ -e source-highlight-esc.sh ]
then
    export LESSOPEN="| source-highlight-esc.sh %s"
    export LESS='-R '
fi

export GREP_COLORS="mt=01;33"
export EDITOR="lvim"

if (( $+commands[lsd] ));
then
    alias ls='lsd'
    alias la='lsd -laFh'
else
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'
# alias G='| rg'
alias mkdir='mkdir -p -v'
alias svim='sudo vim'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias vimrc='${=EDITOR} ~/.config/nvim/init.vim'
alias tmuxrc='${=EDITOR} ~/.tmux.conf'
if [[ $(uname -n) = 'ws-9078' ]];
then
    alias vim=~/nvim.appimage
else
    alias vim=lvim
fi
alias help=tldr
# alias vncd='ssh -L 5900:127.0.0.1:5900 everland x11vnc -display :0'

# fix home, delete and return bindings
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char

# bind jj to ESC
bindkey "jj" vi-cmd-mode
# bindkey "bb" vi-cmd-mode

# tldr for Android
if [ $(uname -o) '==' 'Android' ];
then
    export TLDR_OS=linux
fi

# yadm aliases
alias yd='yadm'
alias yda='yadm add'
alias ydaa='yadm status --short | awk '\''{print $2}'\'' | xargs yadm add -v'
alias ydc='yadm commit'
alias ydco='yadm checkout'
alias ydd='yadm diff'
alias ydp='yadm push'
alias ydl='yadm pull'
alias ydll='yadm stash push && yadm pull && yadm pop'
alias ydst='yadm status'
alias ydsta='yadm stash push'
alias ydstp='yadm stash pop'

# source zshrc
alias zshrl='source ~/.zshrc'

# remove fd alias
# unalias fd
# alias fixconky="killall conky && conky &;disown conky"
alias gmm='git merge master'
alias gma='git merge --abort'

gls() {
     for d in ./*/ ; do (echo "$d" && cd "$d" && git checkout master && git pull -q); done
}
