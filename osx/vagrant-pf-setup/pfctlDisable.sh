#!/usr/bin/expect -f
spawn sudo pfctl -d
expect "Password:"
send "yourpassword\r"
interact
