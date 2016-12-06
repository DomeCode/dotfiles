###
# ~~ System Configuration
# ~~ DO NOT EDIT!
###

# Enable History
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Export System Variables
export EDITOR=vim

# Set Options
setopt append_history
setopt share_history
setopt extended_history
setopt histignorealldups
setopt histignorespace
setopt auto_cd
setopt extended_glob
setopt longlistjobs
setopt nonomatch
setopt notify
setopt hash_list_all
setopt completeinword
setopt nohup
setopt auto_pushd
setopt nobeep
setopt pushd_ignore_dups
setopt noglobdots
setopt noshwordsplit
setopt nohashdirs
setopt HIST_IGNORE_DUPS
setopt unset

# Load Externals
autoload -U compinit promptinit
compinit
promptinit

# Load the "help"-Command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

# Create Bind-Keys
# create a zkbd compatible hash to add other keys to this hash (see -> man 5 terminfo)
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Enable History-Search for special Beginnings
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

###
# ~~ User Configuration
# ~~ Edit here
###

# Set default prompt
prompt redhat

# Load Syntax-Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Aliases
alias ll="ls -FlAh --color=auto"
alias ls="ls -Flh --color=auto"
alias grep="grep --color=auto"
alias proc="ps -ef | grep $1"
alias wttr="curl http://wttr.in/Osnabrueck"
alias x="exit "

# Generate Random Password
genpasswd() {
    local INPUT=$1
        [ "$INPUT" == "" ] && l=16
        tr -dc A-Za-z0-9 < /dev/urandom | head -c ${INPUT} | xargs
}

# Extended ping command
pingim() {
    local INPUT=$1
    ping -i 0.2 -vO -s 504 $INPUT | while read PING; do echo "$(date +%d.%m.%Y-%H:%M:%S): $PING" 2>&1 ; done
}

hds() {
    local INPUT=$1
    local DEVICE='/dev/sdb'
        if [ "$INPUT" == "slow" ]; then
            sudo hdparm -B 50 -S 1 $DEVICE
        elif [ "$INPUT" == "fast" ]; then
            sudo hdparm -B 254 -S 60 $DEVICE
        fi
}
