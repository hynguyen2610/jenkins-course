#!/bin/bash

# Start ssh daemon
/usr/sbin/sshd -D

# Start the php process in background
php-fpm -c /etc/php/fpm

# Start nginx foregr
nginx