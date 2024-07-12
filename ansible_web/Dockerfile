FROM remote_host

RUN dnf install -y nginx && \
    dnf clean all && \
    systemctl enable nginx

# RUN yum -y install php71u-fpm php71u-cli php71u-mysqlnd php71u-soap php71u-xml php71u-zip php71u-json php71u-mcrypt php71u-mbstring php71u-gd  --enablerepo=ius && yum clean all
RUN yum -y install php-fpm php-cli php-mysqlnd php-soap php-xml php-zip php-json php-mbstring php-gd
# Currently php-mcrypt is deprecated and remove in php 7.2, if there is issue in future
# dnf install php-pecl-mcrypt_compat
EXPOSE 80 443

VOLUME /var/wwww/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

RUN setfacl -R -m u:remote_user:rwx /usr/share/nginx/html

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./conf/jenkins.conf /etc/nginx/default.d/jenkins.conf

COPY ./bin/start.sh /start.sh

COPY ./index.php /usr/share/nginx/html/
COPY ./index.html /usr/share/nginx/html

RUN mkdir -p /usr/local/var/log/nginx/

RUN mkdir -p /run/php-fpm/

COPY ./bin/start.sh /start.sh

RUN chmod +x start.sh

CMD ["/start.sh"]
