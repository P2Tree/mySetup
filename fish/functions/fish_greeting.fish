function fish_greeting
    set user (whoami)
    set host (hostname -s)
    set ip (hostname -I | awk '{print $1}')
    set date_time (date "+%Y-%m-%d %H:%M:%S")
    set uptime_info (uptime -p | sed 's/up //')
    set kernel (uname -r)

    # set disk (df -h / | awk 'NR==2 {print $5}')

    set faces "🐟" "🐠" "🐡" "🎣" "⚡" "🍺" "🚀" "💻"
    set random_face (echo $faces | tr ' ' '\n' | shuf -n1)

    echo ""
    echo "  $random_face  Fish Shell $FISH_VERSION"
    echo "  ───────────────────────────────────"
    echo "      User:      $user@$host"
    echo "      IP:        $ip"
    echo "      Login:     $date_time"
    echo "      Uptime:    $uptime_info"
    echo "      Kernel:    $kernel"
    echo "      Shell:     fish"
    echo "  ───────────────────────────────────"
    echo ""
end
