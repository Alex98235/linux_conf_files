# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Path Variables
# zig
path+=("/home/alex/Zig/zig-linux-x86_64-0.14.0-dev.244+0d79aa017")
# zls
path+=("/home/alex/zls/zig-out/bin")
export PATH
autoload -U compinit; compinit


#start zsh in tmux session
ZSH_TMUX_AUTOSTART=true

plugins=(
   git 
   zsh-syntax-highlighting 
   tmux
   zsh-autosuggestions
   you-should-use
   shellfirm
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
   export EDITOR='mvim'
 fi


alias pf="fdfind --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"


eval "$(starship init zsh)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/alex/.zshrc'
setopt globdots # lets zsh "see" hidden files

autoload -Uz compinit
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
