# config
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"
export CLICOLOR=1

## history
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

# aliases
alias switch="gcloud config configurations activate"
alias run_ngrok="ngrok http --url=$NGROK_URL"
alias la="ls -a"
alias exifstrip='exiftool \
  "-gps*=" \
  -Make= \
  -Model= \
  -LensMake= \
  -LensModel= \
  "-*SerialNumber*=" \
  -OwnerName= \
  -HostComputer= \
  -MakerNotes:All= \
  -IPTC:City= \
  -IPTC:Sub-location= \
  -IPTC:Province-State= \
  -IPTC:Country-PrimaryLocationCode= \
  -IPTC:Country-PrimaryLocationName= \
  -XMP:City= \
  -XMP:State= \
  -XMP:Country= \
  -XMP:CountryCode= \
  -XMP:Location= \
  "-XMP:LocationCreated*=" \
  "-XMP:LocationShown*=" \
  -Keys:LocationName='

# plugins
source <(fzf --zsh)
eval "$("$(brew --prefix)/bin/zsh-patina" activate)"
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
source /opt/homebrew/share/zsh-autopair/autopair.zsh
eval "$(fnm env --use-on-cd --shell zsh)"

source ~/.config/zsh-abbr/.zsh-abbr-highlight

FPATH="/opt/homebrew/share/zsh-completions:$FPATH"

# completions
autoload -Uz compinit
if [[ -z ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit -u
else
  compinit -C
fi

# allows case insensitive tab completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# allows using arrow keys for tab completion
zstyle ':completion:*' menu select

if (( $+commands[zoxide] )); then
  eval "$(zoxide init --hook prompt --cmd cd zsh)"
  export _ZO_EXCLUDE_DIRS="/node_modules:/.git:/dist:/build"
fi

# starship (prompt theme)
eval "$(starship init zsh)"

# show fastfetch on start
fastfetch -c ~/.config/fastfetch/meow.jsonc