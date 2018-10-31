FROM centos:7

RUN yum -y update && \
    yum -y install less which tree httpd mod_security && \
    yum clean all

COPY index.html /var/www/html/

COPY conf/ /etc/httpd/conf/
COPY modsecurity.d/crs-setup.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/modsecurity.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/rules/* /etc/httpd/modsecurity.d/rules/

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#RUN /usr/sbin/httpd -D FOREGROUND
#RUN httpd -t  # no work
