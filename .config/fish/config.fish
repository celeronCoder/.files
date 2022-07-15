if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/khushal/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end


# deno
export DENO_INSTALL="/home/khushal/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export DENO_DEPLOY_TOKEN="ddp_QLbDfRlMKpXSf3oCF20Hp8wVVxThDw1whFbV"

# tmux alias
alias tsh="tmux split-window -h"
alias tsv="tmux split-window -v"

# Bun
set -Ux BUN_INSTALL "/home/khushal/.bun"
set -px --path PATH "/home/khushal/.bun/bin"

# flyctl
export FLYCTL_INSTALL="/home/khushal/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
