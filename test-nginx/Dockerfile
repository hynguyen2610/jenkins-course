# Use Oracle Linux 8 as base image
FROM oraclelinux:8

# Install necessary packages (nginx and any other dependencies)
RUN dnf install -y nginx && \
    dnf clean all && \
    systemctl enable nginx

# Copy custom Nginx configuration with jenkins.local server block
COPY nginx.conf /etc/nginx/nginx.conf

COPY ./index.php /var/www/html/

# Start nginx service
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
