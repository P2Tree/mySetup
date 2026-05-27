if status is-interactive
    # Disable greeting
    set -g fish_greeting

    # Show full path name
    set -g fish_prompt_pwd_dir_length 0

    # Alias
    type -q nvim && abbr -a vim nvim
    type -q nvim && abbr -a v nvim
    type -q nvim && abbr -a vimdiff "nvim -d"

    type -q rg && abbr -a rg "rg -S"

    abbr -a vimconf 'nvim ~/.config/fish/config.fish'

    if type -q git
        abbr -a gs "git stash"
        abbr -a gst "git status"
        abbr -a gb "git branch"
        abbr -a ga "git add"
        abbr -a gau "git add -u"
        abbr -a gc "git commit -v"
        abbr -a gca "git commit --amend -v"
        abbr -a gco "git checkout"
        abbr -a gd "git diff"
        abbr -a gds "git diff --staged"
        abbr -a gr "git reset"
        abbr -a gl "git log --stat"
        abbr -a glg "git log --oneline --graph --decorate --all"
        abbr -a gps "git push"
        abbr -a gpsf "git push --force"
        abbr -a gpl "git pull"
        abbr -a gplr "git pull --rebase"
    end

    if type -q eza
        abbr -a l eza
        abbr -a ll "eza -l"
        abbr -a la "eza -a"
        abbr -a lla "eza -la"
        abbr -a lt "eza --sort=time -l"
        abbr -a ltr "eza --sort=time -lr"
        abbr -a tree "eza -T"
    end

    if type -q bat
        abbr -a cat "bat -pp"
    end

    # Program Init
    # zoxide
    zoxide init fish | source

end

function reload
    source ~/.config/fish/config.fish
    echo "Fish config reloaded"
end
