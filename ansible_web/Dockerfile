FROM remote_host

RUN dnf install -y nginx && \
    dnf clean all

RUN yum -y install php-fpm php-cli php-mysqlnd php-soap php-xml php-zip php-json php-mbstring php-gd
# Currently php-mcrypt is deprecated and remove in php 7.2, if there is issue in future
# dnf install php-pecl-mcrypt_compat
EXPOSE 80 443

RUN setfacl -R -m u:remote_user:rwx /usr/share/nginx/html

COPY ./bin/start.sh /start.sh

COPY ./table.j2 /usr/share/nginx/html/index.php

RUN mkdir -p /usr/local/var/log/nginx/

RUN mkdir -p /run/php-fpm/

COPY ./bin/start.sh /start.sh

RUN chmod +x start.sh

CMD ["/bin/bash", "-c", "/usr/sbin/sshd && php-fpm -F -R -c /etc/php/fpm && nginx -g 'daemon off;'"]

