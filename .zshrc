# config
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"
export CLICOLOR=1

## history
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# aliases
alias switch="gcloud config configurations activate"
alias run_ngrok="ngrok http --url=$NGROK_URL"
alias la="ls -a"

# plugins
source <(fzf --zsh)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# enable abbreviations highlighting
(( ${#ABBR_REGULAR_USER_ABBREVIATIONS} )) && {
  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
  ZSH_HIGHLIGHT_REGEXP+=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' fg=green)
  ZSH_HIGHLIGHT_REGEXP+=('\<('${(j:|:)${(Qk)ABBR_GLOBAL_USER_ABBREVIATIONS}}')$' fg=green)
}

eval "$(starship init zsh)"