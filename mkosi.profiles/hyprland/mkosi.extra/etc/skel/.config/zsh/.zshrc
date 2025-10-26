source ~/.config/zsh/catppuccin_latte.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob nomatch
bindkey -e
