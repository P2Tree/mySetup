# ~/.config/fish/config.fish

# =========================================================
# 0. only allow with interactive shell
# =========================================================
status is-interactive; or return

# =========================================================
# 1. PATH (use fish_add_path to setup PATH)
# =========================================================
# Homebrew（Apple Silicon / Intel / Linux）
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# local bin
fish_add_path --prepend $HOME/.local/bin
fish_add_path --append $HOME/bin

# Cargo and other command tools (add if needed)
if type -q cargo
    test -d $HOME/.cargo/bin; and fish_add_path $HOME/.cargo/bin

    set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
    set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"
end

# edit this to reconfig proxy
set -gx http_proxy http://127.0.0.1:6518
set -gx https_proxy http://127.0.0.1:6518

# =========================================================
# 2. Environment variables and fish configuration
# =========================================================
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

if type -q nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx LESS -R

set -g fish_greeting "" # close greeting message
set -g fish_autosuggestion_enabled 1
set -g fish_escape_delay_ms 10

# =========================================================
# 3. alias and abbr
# =========================================================
# safety habits
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'

# command abbrs
function abbr_set --description 'delete and add new abbr'
    if test (count $argv) -lt 2
        echo "usage: abbr_set NAME EXPANSION" >&2
        return 1
    end
    set -l name $argv[1]
    set -l expansion $argv[2..-1]
    abbr -e $name 2>/dev/null
    abbr -a $name $expansion
end

abbr_set ll 'ls -lah'
abbr_set la 'ls -A'
abbr_set lt 'ls -lt'
abbr_set ltr 'ls -ltr'
abbr_set .. 'cd ..'
abbr_set ... 'cd ../..'

abbr_set gs 'git status'
abbr_set gb 'git branch'
abbr_set gd 'git diff'
abbr_set ga 'git add'
abbr_set gc 'git commit'
abbr_set go 'git checkout'
abbr_set gl 'git log --oneline --graph --decorate'
abbr_set gps 'git push'
abbr_set gpl 'git pull'

abbr_set dh 'df -h -a -T'
abbr_set ds 'du -sh'

# reload this file
abbr_set reload 'source ~/.config/fish/config.fish'

# edit this file
abbr_set fishconf '$EDITOR ~/.config/fish/config.fish'

# add some abbrs for custom tools
if type -q nvim
    abbr_set vim nvim
    abbr_set vimdiff 'nvim -d'
end

if type -q rg
    abbr_set rg 'rg -S'
end

# =========================================================
# 4. Custom tools configuration
# =========================================================
if type -q zoxide
    set -gx _ZO_DATA_DIR $HOME/.local/share/zoxide
    zoxide init fish | source
end

if type -q eza
    abbr_set ls eza
    abbr_set ll 'eza -lah'
    abbr_set lt 'eza -l -s modified'
    abbr_set ltr 'eza -l -s modified -r'
end

if type -q bat
    abbr_set cat 'bat -pp'
end

# fzf
if command -q fzf
    # key mapping can be setting by fzf.fish plugin
    set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
    command -q fd; and set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
end

# =========================================================
# 5. Source local configuration file (not into version control)
# =========================================================
if test -f $HOME/.config/fish/conf.d/local.fish
    source $HOME/.config/fish/conf.d/local.fish
end
