# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.local/share/history/zsh_history
HISTSIZE=1000
SAVEHIST=10000

### EXPORT
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

# "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Syntax highlighting and autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Autopairs
zinit ice wait lucid id-as"auto"
zinit load hlissner/zsh-autopair

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

autoload -Uz compinit
compinit

# Vi mode
bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Setting up path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/share/npm/bin" ] ;
  then PATH="$HOME/.local/share/npm/bin:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin/" ] ;
  then PATH="$HOME/.config/emacs/bin:$PATH"
fi

alias ls='exa -l --icons'
alias tree='exa --tree --icons'
alias update='cp -r ~/.config/{hypr,alacritty,kitty,gtk-3.0,nvim,spicetify,zathura} ~/Repos/hypr-dots/config/ && cp ~/.zshrc ~/Repos/hypr-dots/'

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=~/.npm-global/bin:$PATH

# bun completions
[ -s "/home/ashin/.bun/_bun" ] && source "/home/ashin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gbrain NIM credentials (key lives in chmod-600 ~/.gbrain/secrets.env)
source ~/.gbrain/secrets.env

# opencode
export PATH=/home/ashin/.opencode/bin:$PATH
