FROM centos:7

RUN yum -y update && \
    yum -y install less which tree httpd mod_security && \
    yum clean all

COPY index.html /var/www/html/

#COPY conf/ /etc/httpd/conf/
COPY modsecurity.d/crs-setup.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/modsecurity.conf /etc/httpd/modsecurity.d/
COPY modsecurity.d/rules/* /etc/httpd/modsecurity.d/rules/

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
RUN echo "<IfModule security2_module>" >> /etc/httpd/conf/httpd.conf
RUN echo "  Include modsecurity.d/crs-setup.conf" >> /etc/httpd/conf/httpd.conf
RUN echo "  Include modsecurity.d/rules/*.conf" >> /etc/httpd/conf/httpd.conf
RUN echo "  SecRuleEngine On" >> /etc/httpd/conf/httpd.conf
RUN echo "</IfModule>" >> /etc/httpd/conf/httpd.conf



EXPOSE 80

RUN /usr/sbin/httpd -D FOREGROUND
