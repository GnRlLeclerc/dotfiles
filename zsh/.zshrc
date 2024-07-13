# XDG environment
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit

# Zinit home directory. Defaults to ~/.local/share/zinit/zinit.git
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   command mkdir -p "$(dirname $ZINIT_HOME)"
   command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# P10k
# Load Powerlevel10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k


# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light asdf-vm/asdf


# Completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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


# Shell integration
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"


# Aliases
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)' # Autoremove orphan packages
alias cargo-update='cargo install-update -a' # Update all programs installed via "cargo install"
alias cat='bat --paging=never --style=plain' # Bat without paging
alias du=dust
alias grep=rg
alias less='bat --paging=always --style=plain' # Bat with always paging
alias lolcat=dotacat
alias neofetch=fastfetch
alias ps=procs
alias icat='wezterm imgcat'
alias c=clear

# Eza aliases
alias ls="eza -g --icons --header --group-directories-first"
alias la="eza -ag --icons --header --group-directories-first"
alias lr="eza -lTg -L 2 --icons --header --group-directories-first"
alias lR="eza -lTg --icons --header --group-directories-first"
alias lu="eza -l --total-size --no-time --no-user --no-permissions --sort size --reverse"

# For image processing (Figma & EPFL project)
alias resize-pngs='for img in *.png; do convert "$img" -resize 1920x1080! "$img"; done'

# Git util
alias git-remove-local="git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"


# Environment variables

# Android emulator (enable starting expo app directly in emulator)
export ANDROID_HOME=$HOME/Android/Sdk
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring  # Silence poetry
  
# Golang paths
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Rust paths
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"

# Remote nvim for synctex
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Key bindings

# Search history with key up / down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# SSH completions

# Initialize an array to store host names for auto-completion
hosts=()
config_files=(~/.ssh/config ~/.ssh/config-br/config)

extract_hosts() {
    # Read the file content and process each line
    while IFS= read -r line || [[ -n $line ]]; do
        # Remove carriage return characters that might have been included from Windows-style line endings
        line="${line//$'\r'/}"
        # Check if the line starts with "Host" and process it
        if [[ "$line" =~ ^Host[[:space:]]+ ]]; then
            # Extract the host name by removing 'Host ' and trim any leading or trailing whitespace
            host_name=${line#Host }
            host_name=${host_name%%*( )}
            hosts+=("$host_name")
        fi
    done < $1
}

# Extract host names from all SSH configuration files
for config_file in $config_files; do
    if [[ -f $config_file ]]; then
        extract_hosts $config_file
    fi
done

# Set up command-line completion for ssh if hosts are gathered
if (( ${#hosts} > 0 )); then
    zstyle ':completion:*:ssh:*' hosts $hosts
    zstyle ':completion:*:slogin:*' hosts $hosts
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thibaut/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thibaut/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/thibaut/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thibaut/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/thibaut/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/thibaut/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# Source color schemes
source ~/.fzf_colors.zsh

# Bat & delta color theme
export BAT_THEME="base16"

