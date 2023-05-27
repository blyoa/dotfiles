
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

alias ghq-cd='cd $(ghq list -p | peco)'
# }}}

# zinit {{{
# zinit installer {{{
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P '%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f'
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P '%F{33}▓▒░ %F{34}Installation successful.%f%b' || \
        print -P '%F{160}▓▒░ The clone has failed.%f%b'
fi

. "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
  zdharma-continuum/zinit-annex-{'readurl','bin-gem-node','patch-dl','rust'}
# }}}

zinit light rupa/z
zinit light zsh-users/zsh-completions
# }}}

# vim: foldmethod=marker

# added by travis gem
[ -f /home/vagrant/.travis/travis.sh ] && source /home/vagrant/.travis/travis.sh
