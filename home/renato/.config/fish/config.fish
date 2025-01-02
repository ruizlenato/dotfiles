# Set paths and environment variables
if status is-login
    set -x GOPATH $HOME/.local/share/go

    set PATH $HOME/.local/bin $PATH
    set PATH $GOPATH/bin $PATH

    set -Ux SSH_AUTH_SOCK $HOME/.goldwarden-ssh-agent.sock
    set -Ux GOLDWARDEN_SOCKET_PATH $HOME/.goldwarden.sock
    set -x EDITOR "/usr/bin/nvim"
    set -x XDG_CONFIG_HOME "$HOME/.config"
    set -x XDG_CACHE_HOME "$HOME/.cache"
    set -x XDG_USER_LOCAL "$HOME/.local"
    set -x XDG_DATA_HOME "$HOME/.local/share"
end

# Set up fzf key bindings
fzf --fish | source

# Set aliases and abbreviations
abbr vi nvim
abbr vim nvim

# Set prompt
function fish_prompt
    printf '%s%s ➜ ' (basename (prompt_pwd)) (fish_git_prompt)
end

# Configure LESS: https://github.com/fish-shell/fish-shell/issues/5713
set -x LESS "-R"

# Disable greetings
set -g fish_greeting

# Configure git prompt
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showstashstate true
set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_showupstream auto
set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_cleanstate ''
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '?'
