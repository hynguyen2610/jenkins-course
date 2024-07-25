# Use Alpine Linux as the base image
FROM alpine:latest

# Install SSH and create necessary directories
RUN apk update && \
    apk add --no-cache openssh && \
    mkdir -p /var/run/sshd

# Copy authorized_keys file into the container
COPY ./id_rsa.pub /root/.ssh/authorized_keys

# Generate SSH host keys (if not already generated)
RUN ssh-keygen -A

# Install Git server (assuming you're using OpenSSH for Git over SSH)
RUN apk add --no-cache git

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
