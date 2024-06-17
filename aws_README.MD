To install AWS CLI client on remote_host
centos7 image has python 2.7 by default so
```
RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python3 get-pip.py && \
    pip install awscli --upgrade
```    
    