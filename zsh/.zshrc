
# environment variables {{{
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# }}}

# setopt {{{
setopt auto_cd
setopt extended_glob

setopt auto_pushd
setopt pushd_ignore_dups

setopt hist_ignore_space
# }}}

# autoload {{{
autoload -Uz compinit; compinit
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
# }}}

# prompt {{{
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' max-exports 4
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '(%s)-[' '%c%u' '%F{green}%b%f|%F{red}%a%f' ']'
zstyle ':vcs_info:*' formats       '(%s)-[' '%c%u' '%F{green}%b%f'             ']'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}-%f'
function _update_vcs_info_msg() {
    local message=""
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && message+="$vcs_info_msg_0_"
    [[ -n "$vcs_info_msg_1_" ]] && message+="$vcs_info_msg_1_"' '
    [[ -n "$vcs_info_msg_2_" ]] && message+="$vcs_info_msg_2_"
    [[ -n "$vcs_info_msg_3_" ]] && message+="$vcs_info_msg_3_"

    RPROMPT="$message"
}
add-zsh-hook precmd _update_vcs_info_msg
PROMPT=$'%F{green}%n@%m%f %F{yellow}%~%f\n%(?.%#.%F{red}%#%f) '
# }}}

# bindkey {{{
bindkey -e
bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^U' backward-kill-line
# }}}

# aliases {{{
alias ls='ls --color'
alias la='ls -a'
alias lf='ls -F'
alias ll='ls -l'
alias dir='ls --color=auto --format=vertical'

alias du='du -h'
alias df='df -h'
# }}}

# zplug {{{
source ~/.zplug/init.zsh
zplug "rupa/z", use:z.sh, nice:10
#zplug "peco/peco", as:command, from:gh-r
zplug "zsh-users/zsh-completions", as:command
#"zplug "riywo/anyenv", as:command, dir:"~/.anyenv", use:bin, if:"[[ $OSTYPE == *linux* ]]"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
# }}}

# plugin settings {{{
if type anyenv 2>/dev/null 2>&1; then
    eval "$(anyenv init - zsh)"
fi
# }}}

# vim: foldmethod=marker

# added by travis gem
[ -f /home/vagrant/.travis/travis.sh ] && source /home/vagrant/.travis/travis.sh
