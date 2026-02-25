# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DISABLE_AUTO_TITLE='true'

# Common zsh configuration shared across machines.
export ZSH="$HOME/.oh-my-zsh"
export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

path=(
  "$HOME/bin"
  "/usr/local/bin"
  "$HOME/.local/bin"
  "$HOME/.local/share/bob/nvim-bin"
  "$HOME/.local/share/visualvm/bin"
  "$BUN_INSTALL/bin"
  "$HOME/.cozyutils/bin"
  $path
)
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
)

zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.zsh_functions"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias setenv="set -a && source .env && set +a"
alias cmsg="cozyutils -cmsg --commit"
alias viewjacoco="cd build/reports/jacoco/test/html && python3 -m http.server 8081"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -s "$HOME/.config/pd/pd.sh" ] && source "$HOME/.config/pd/pd.sh"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

