# Use the official Jenkins base image
FROM fortinux/jenkins-ansible

# Switch to root user to install additional software
USER root

# Install necessary packages for SSH key generation
RUN apt-get update && \
    apt-get install -y openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Install ping command
RUN apt-get update && \
apt-get install -y iputils-ping && \
rm -rf /var/lib/apt/lists/*

USER jenkins

# Generate SSH key pair for Jenkins user
# Uncomment these lines only when ssh key re-generating is needed.
# At the time it is presented at jenkins_home/.ssh and should be reused.
# RUN ssh-keygen -t rsa -b 4096 -C "jenkins@example.com" -f /var/jenkins_home/.ssh/remote_key -q -N ""
# RUN chown jenkins:jenkins /var/jenkins_home/.ssh/remote_key*

# Ensure correct ownership of Jenkins home directory
RUN chown -R 1000:1000 /var/jenkins_home
