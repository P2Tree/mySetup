#!/usr/bin/env fish
#
# NOTE: run the script only once: after first install fish
# NOTE: usage: fish ./init.fish

set -l ok 0
set -l skipped 0
set -l failed 0

function __say_ok --argument-names msg
    set_color green
    echo "  ✓ $msg"
    set_color normal
end
function __say_skip --argument-names msg
    set_color brblack
    echo "  - $msg (skipped)"
    set_color normal
end
function __say_fail --argument-names msg
    set_color red
    echo "  ✗ $msg"
    set_color normal
end
function __say_info --argument-names msg
    set_color brblack
    echo "  * $msg"
    set_color normal
end

function __has_cmd --argument-names cmd
    type -q $cmd
end
function __has_tool --argument-names cmd
    type -q $cmd
end

# ---------- Basic ----------
echo "==> Check fish environment"
if not command -q fish
    __say_fail "Do not find fish, please install fish manually"
    exit 1
end
__say_ok "fish ready: "(fish --version)

if not command -q curl
    __say_fail "Do not find curl，please install curl manually"
    exit 1
end
__say_ok "curl ready"

# ---------- Fisher plugin manager ----------
echo ""
echo "==> Install fisher plugin manager"
if __has_cmd fisher
    __say_skip "fisher ($(fisher --version 2>/dev/null | head -1))"
    set ok (math $ok + 1)
else
    __say_info "install fisher..."
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    and fisher install jorgebucaran/fisher >/dev/null 2>&1
    if type -q fisher
        __say_ok "fisher installed"
        set ok (math $ok + 1)
    else
        __say_fail "fail to install fisher"
        set failed (math $failed + 1)
    end
end

# ---------- Fish plugins ----------
echo ""
echo "==> Install fish plugins"

set -l plugins \
    jorgebucaran/nvm.fish \
    PatrickF1/fzf.fish \
    jethrokuan/z \
    jorgebucaran/autopair.fish

if type -q fisher
    for p in $plugins
        if fisher list 2>/dev/null | string match -q -- $p
            __say_skip $p
            set skipped (math $skipped + 1)
        else
            __say_info "install $p..."
            fisher install $p >/dev/null 2>&1
            or begin
                __say_fail "fail to install $p"
                set failed (math $failed + 1)
                continue
            end
            __say_ok "$p installed"
            set ok (math $ok + 1)
        end
    end
else
    __say_fail "fisher not available, skip install plugins"
    set failed (math $failed + 1)
end

# ---------- Ensure config.fish existed ----------
echo ""
echo "==> Check config.fish"
set -l cfg $HOME/.config/fish/config.fish
if not test -e $cfg
    mkdir -p (dirname $cfg)
    printf '# fish config\n' >$cfg
    __say_ok "$cfg created"
    set ok (math $ok + 1)
else
    __say_skip $cfg
    set skipped (math $skipped + 1)
end

# ---------- Final check ----------
echo ""
echo "==> Completed: success $ok, skip $skipped, fail $failed"
if test $failed -gt 0
    set_color red
    __say_fail "Fail items existed, check messages below with ✗"
    set_color normal
    exit 1
else
    set_color green
    __say_ok "Initializa fish shell environment completed"
    set_color normal
    exit 0
end
