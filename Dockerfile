FROM centos:7

RUN yum -y update && \
    yum -y install less which tree httpd mod_security && \
    yum clean all

COPY index.html /var/www/html/

COPY conf           /etc/httpd/conf
COPY conf.d         /etc/httpd/conf.d
COPY modsecurity.d  /etc/httpd/modsecurity.d

EXPOSE 80

RUN /usr/sbin/httpd -D FOREGROUND
