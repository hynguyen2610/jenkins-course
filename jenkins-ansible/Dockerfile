# Use the official Jenkins base image
FROM fortinux/jenkins-ansible

# Switch to root user to install additional software
USER root

# Install necessary packages for SSH key generation
RUN apt-get update && \
    apt-get install -y openssh-client

# Install ping command

RUN apt-get install -y iputils-ping && \
rm -rf /var/lib/apt/lists/*

RUN chown -R 1000:1000 /var/jenkins_home

# Install necessary packages and Docker
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# (Optional) Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


USER jenkins

# Generate SSH key pair for Jenkins user
# Uncomment these lines only when ssh key re-generating is needed.
# At the time it is presented at jenkins_home/.ssh and should be reused.
# RUN ssh-keygen -t rsa -b 4096 -C "jenkins@example.com" -f /var/jenkins_home/.ssh/remote_key -q -N ""
# RUN chown jenkins:jenkins /var/jenkins_home/.ssh/remote_key*

# Ensure correct ownership of Jenkins home directory
