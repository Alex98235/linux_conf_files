# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# For zellij split panes, which for some reason look at the SHELL variable
# instead of whatever the previous pane is running as shell
export SHELL="zsh" 

# Creature comfort
alias hx=helix

# Path Variables
#oh my posh, etc...
path+=("/home/alex/.local/bin/")

export PATH
autoload -U compinit; compinit

plugins=(
   git 
   zsh-syntax-highlighting
   zsh-autosuggestions
   you-should-use
)


# zsh-syntax-highlighting config:
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# color reserved-words
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'

ZSH_HIGHLIGHT_STYLES[path]='none'

ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,bold'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=orange'

# To disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='none'
# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'


source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='helix'
 fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/alex/.zshrc'
setopt globdots # lets zsh "see" hidden files

autoload -Uz compinit
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

# https://zellij.dev/documentation/installation
eval "$(oh-my-posh init zsh --config ~/ohmyposhconfigs/tonybaloneycustom.omp.json)"
eval "$(zellij setup --generate-auto-start zsh)"
