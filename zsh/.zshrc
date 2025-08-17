# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi






# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi



# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light ohmyzsh/ohmyzsh 
# zinit light starship/starship
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZ::plugins/git
#zinit snippet OMZ::plugins/zsh-autosuggestions
#zinit snippet OMZ::plugins/zsh-syntax-highlighting 
#zinit snippet OMZ::plugins/you-should-use 
#zinit snippet OMZ::plugins/zsh-bat

# Load completions
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


#Paths
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ls='ls --color'
alias c='clear'

# zoxide
eval "$(zoxide init zsh)" 
fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(zoxide init --cmd cd zsh)" # replace traditional cd with zoxide smart cd



# pnpm
export PNPM_HOME="/home/nelson/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# go language
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
# go language end


# Git
alias credential-clear='git config --global --unset credential.helper'

# direnv
eval "$(direnv hook zsh)"

# bun completions
[ -s "/home/nelson/.bun/_bun" ] && source "/home/nelson/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#Tmux
export TMUX_CONF=$HOME/.config/tmux/tmux.conf

# Fzf
source <(fzf --zsh)

#StarShip Prompt
# eval "$(starship init zsh)"

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH


# fnm
FNM_PATH="/home/nelson/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

export GST_PLUGIN_PATH=/usr/lib/gstreamer-1.0:$GST_PLUGIN_PATH

export GST_PLUGIN_PATH=/usr/lib/gstreamer-1.0:$GST_PLUGIN_PATH

