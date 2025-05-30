# -----------------------------------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT 
# -----------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# THEME 
# -----------------------------------------------------------------------------

ZSH_THEME="powerlevel10k/powerlevel10k"

# -----------------------------------------------------------------------------
# OH MY Z-SH (or Manjaro’s wrapper) — load the right one per OS
# -----------------------------------------------------------------------------
# Ensure $ZSH is set, fallback to ~/.oh-my-zsh if unset

ZSH="${ZSH:-$HOME/.oh-my-zsh}"

case "$OSTYPE" in
  linux-gnu*)
    # On Manjaro/Arch, use their system-wide config if present
    if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
      source /usr/share/zsh/manjaro-zsh-config
    else
      source "$ZSH/oh-my-zsh.sh"
    fi
    ;;
  darwin*)
    [[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
    # <<< Add any macOS-only tweaks here (e.g. homerow, macOS-specific env) >>>
    ;;
  *)
    # Other UNIX-like: fallback to upstream Oh My Z-sh if available
    [[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
    ;;
esac

# -----------------------------------------------------------------------------
# CUSTOM SETTINGS (plugins, aliases, env vars, etc.)
# -----------------------------------------------------------------------------

# Use powerline-style prompt icons
USE_POWERLINE="true"
HAS_WIDECHARS="false"

# Plugins (Oh My Z-sh will load these)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  docker
  tmux
)

# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$HOME/.zsh_history"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/lib/go/bin:$GOPATH/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Aliases
alias dbb='sqlitebrowser .'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias dotfiles='~/ --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias reload!='source ~/.zshrc'    
alias prel='p10k reload'           

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

  # Hints daemon (Arch/Manjaro)
  if command -v hints &>/dev/null; then
    pgrep -x hintsd &>/dev/null || nohup hintsd &>/dev/null 2>&1 &
    export ACCESSIBILITY_ENABLED=1
    export GTK_MODULES=gail:atk-bridge
    export OOO_FORCE_DESKTOP=gnome
    export GNOME_ACCESSIBILITY=1
    export QT_ACCESSIBILITY=1
    export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
  else
    echo "Hints not installed; get it from https://github.com/AlfredoSequeida/hints"
  fi
  alias lsa='ls -a --color=auto'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  :
fi

precmd() {
  [[ -n "$TMUX" ]] && tmux rename-window "$(basename "$PWD")"
}

# -----------------------------------------------------------------------------
# Source Powerlevel10k config 
# -----------------------------------------------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
