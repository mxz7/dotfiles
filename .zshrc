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
alias psqlnypsi="psql-18 '$NYPSI_POSTGRES'"

# plugins
source <(fzf --zsh)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(fnm env --use-on-cd --shell zsh)"

FPATH="/opt/homebrew/share/zsh-completions:$FPATH"

# completions
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit -u
else
  compinit -C
fi

# allows case insensitive tab completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# enable abbreviations highlighting
(( ${#ABBR_REGULAR_USER_ABBREVIATIONS} )) && {
  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
  ZSH_HIGHLIGHT_REGEXP+=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' fg=green)
  ZSH_HIGHLIGHT_REGEXP+=('\<('${(j:|:)${(Qk)ABBR_GLOBAL_USER_ABBREVIATIONS}}')$' fg=green)
}

# starship (prompt theme)
eval "$(starship init zsh)"

# show fastfetch on start
fastfetch -c ~/.config/fastfetch/meow.jsonc