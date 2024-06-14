# Steps to Generate and Copy SSH Key

## 1. Generate SSH Keys in Jenkins (Container A)
Generate the SSH key pair in Jenkins (Container A):
```sh
docker exec -it jenkins bash -c "ssh-keygen -t rsa -b 4096 -C 'your_email@example.com' -f /var/jenkins_home/.ssh/remote-key -N ''"
```
## 2. Copy the pub key to centos7 folder
Just do it
## 3. Start the containers
Run 
```docker-compose up```
remote_host container should be up with public key of jenkins insided its .ssh/authorized_keys
## 4. Testing
```
docker exec -it jenkins ssh -i /var/jenkins_home/.ssh/remote-key remote_user@remote_host
```

