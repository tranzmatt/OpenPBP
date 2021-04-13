#!/usr/bin/expect -f

set MYSQL_ROOT_PASSWORD [lindex $argv 0]

set timeout 0
spawn mysql_secure_installation

expect "Enter current password for root \(enter for none\)\:"
send -- "\r"

expect "Set root password? \[Y/n\]"
send -- "y\r"

expect "New password:"
send -- "$MYSQL_ROOT_PASSWORD\r"

expect "Re-enter new password:"
send -- "$MYSQL_ROOT_PASSWORD\r"

expect "Remove anonymous users? \[Y/n\]"
send -- "y\r"

expect "Disallow root login remotely? \[Y/n\]"
send -- "y\r"

expect "Reload privilege tables now? \[Y/n\]"
send -- "y\r"

expect eof

