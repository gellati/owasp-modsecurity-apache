#FROM alpine:3.7
FROM centos:7

# RUN apk add --no-cache httpd
RUN yum -y update && \
    yum -y install less which tree httpd mod_security && \
    yum clean all

COPY index.html /var/www/html/

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
RUN echo "<IfModule security2_module>" >> /etc/httpd/conf/httpd.conf
RUN echo "Include modsecurity.d/crs-setup.conf" >> /etc/httpd/conf/httpd.conf
RUN echo "Include modsecurity.d/rules/*.conf" >> /etc/httpd/conf/httpd.conf
RUN echo "</IfModule>" >> /etc/httpd/conf/httpd.conf


#COPY conf/ /etc/httpd/conf/
COPY modsecurity.d/crs-setup.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/modsecurity.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/rules/* /etc/httpd/modsecurity.d/rules/

#COPY conf.d/ etc/httpd/conf.d/


EXPOSE 8080

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#RUN /usr/sbin/httpd -D FOREGROUND


#RUN httpd -t  # no work
