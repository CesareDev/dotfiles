source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Only run in interactive shells
status is-interactive; or return

# Aliases (fish supports alias, but functions are more robust)
alias ls "lsd --color=auto --group-directories-first -v --git"
alias ll "lsd -alF --color=auto --group-directories-first -v -A --git"
alias grep "grep --color=auto"
alias q "exit"
alias vim "nvim"

# Default editor
set -x EDITOR nvim

# Init starship
starship init fish | source
