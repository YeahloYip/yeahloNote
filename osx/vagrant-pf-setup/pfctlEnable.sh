#!/usr/bin/expect -f
spawn sudo pfctl -ef ./pf-vagrant.conf
expect "Password:"
send "yourpassword\r"
interact
