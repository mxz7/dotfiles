if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/Users/max/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias ff='fastfetch -c ~/.config/fastfetch/meow.jsonc'

# git aliases
abbr -a gb 'git branch'
abbr -a gc 'git commit'
abbr -a gf 'git fetch'
abbr -a gm 'git merge'
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gs 'git status'
abbr -a gst 'git stash'
abbr -a gsw 'git switch'

starship init fish | source
