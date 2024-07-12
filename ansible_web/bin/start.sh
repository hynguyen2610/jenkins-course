#!/bin/bash

echo "Starting sshd..."

# Start PHP-FPM in the foreground
echo "Starting php-fpm..."
php-fpm -F -R -c /etc/php/fpm &

# Start Nginx in the foreground
echo "Starting nginx..."
nginx -g "daemon off;"

# Start SSH daemon if needed (commented out by default)
/usr/sbin/sshd -D