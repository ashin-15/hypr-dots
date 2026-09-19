if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Znap bootstrap
[ -d ~/.zsh-plugins/zsh-snap ] || git clone https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/zsh-snap
source ~/.zsh-plugins/zsh-snap/znap.zsh

# History setup (before plugins)
HISTFILE=$HOME/.local/share/history/zsh_history
HISTSIZE=1000
SAVEHIST=10000
setopt hist_ignore_all_dups 
setopt share_history       
setopt append_history

# Manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Plugins: order matters now (no lazy-loading)
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source romkatv/powerlevel10k

# Completion styling (after plugins)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
autoload -Uz compinit && compinit

# FZF (system-installed)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Vi mode + cursor shape
bindkey -v
function zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

export ANDROID_HOME="$HOME/Android/Sdk"

# PATH setup
for dir in "$HOME/.local/bin" "$HOME/.local/share/npm/bin" "$HOME/.cargo/bin" "$HOME/.bun/bin" "$HOME/.npm-global/bin" "/home/ashin/.opencode/bin" "/home/ashin/.local/bin" "$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"; do
    [ -d "$dir" ] && PATH="${dir}:$PATH"
done
export PATH


# Aliases
alias ls='exa --icons -l'
alias update='cp -r ~/.config/{hypr,alacritty,kitty,gtk-3.0,nvim,spicetify,zathura} ~/Repos/hypr-dots/config/ && cp ~/.zshrc ~/Repos/hypr-dots/'

# Tool-specific setup
[ -s "/home/ashin/.bun/_bun" ] && source "/home/ashin/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Added by Antigravity CLI installer
export PATH="/home/ashin/.local/bin:$PATH"
