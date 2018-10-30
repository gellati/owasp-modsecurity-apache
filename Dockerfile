#FROM alpine:3.7
FROM centos:7

# RUN apk add --no-cache httpd
RUN yum -y update && \
    yum -y install httpd mod_security && \
    yum clean all

COPY index.html /var/www/html/

COPY conf/ /etc/httpd/conf.d/
#COPY modsecurity.d/crs-setup.conf /etc/httpd/modsecurity.d/
#COPY modsecurity.d/modsecurity.conf /etc/httpd/modsecurity.d/
#COPY conf.d/ etc/httpd/conf.d/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# RUN httpd -t

EXPOSE 80
