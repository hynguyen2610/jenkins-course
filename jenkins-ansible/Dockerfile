# Use the official Jenkins base image
FROM jenkins/jenkins

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

# Set environment variables
ENV JENKINS_HOME=/var/jenkins_home

# Ensure the home directory is set for the Jenkins user
RUN usermod -d $JENKINS_HOME jenkins

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for the virtual environment
RUN mkdir -p /opt/ansible-env

# Create a virtual environment
RUN python3 -m venv /opt/ansible-env

# Activate the virtual environment and install Ansible
RUN /opt/ansible-env/bin/pip install --upgrade pip && \
    /opt/ansible-env/bin/pip install ansible

# Ensure the virtual environment's binaries are in the PATH
ENV PATH="/opt/ansible-env/bin:$PATH"

# Switch back to the jenkins user
USER jenkins

# Print Ansible version to verify the installation
RUN ansible --version
