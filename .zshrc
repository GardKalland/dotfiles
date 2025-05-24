# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
alias lsa='ls -a --color=auto'


export GOPATH=$HOME/go
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin

alias dbb='sqlitebrowser .'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias reload!='source ~/.zshrc'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  docker
  tmux
)

# History settings
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If inside tmux, rename window to current directory
precmd() {
  if [ -n "$TMUX" ]; then
    tmux rename-window "$(basename "$(pwd)")"
  fi
}
# Dotfiles alias
alias dotfiles='~/ --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# pnpm
export PNPM_HOME="/home/hallo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
