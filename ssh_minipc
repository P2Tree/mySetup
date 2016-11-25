#!/usr/bin/expect -f

set ip 192.168.1.43
set password 1406
set timeout 5
spawn ssh ubuntu@$ip
expect {
"*yes/no" { send "yes\r";exp_continue}
"*password:" { send "$password\r" }
}
interact

