FROM registry.access.redhat.com/ubi9/ubi:latest

# Install httpd
RUN dnf install -y httpd && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Remove default Apache welcome page
RUN rm -f /etc/httpd/conf.d/welcome.conf

# Copy static website content: the whole workshop and one variant per part (see build-site.sh)
COPY www/ /var/www/parts/all/
COPY www-inner/ /var/www/parts/inner/
COPY www-outer/ /var/www/parts/outer/

# Part of the workshop to serve: all, inner (Part 1 only) or outer (Part 2 only)
ENV WORKSHOP_PART=all

# Configure httpd for non-root operation
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    sed -i 's/#ServerName www.example.com:80/ServerName localhost:8080/' /etc/httpd/conf/httpd.conf && \
    echo "PidFile /tmp/httpd.pid" >> /etc/httpd/conf/httpd.conf

# Serve the variant selected by WORKSHOP_PART (httpd expands environment variables at startup)
RUN sed -i 's|^DocumentRoot "/var/www/html"|DocumentRoot "/var/www/parts/${WORKSHOP_PART}"|' /etc/httpd/conf/httpd.conf && \
    grep -q '^DocumentRoot "/var/www/parts/${WORKSHOP_PART}"' /etc/httpd/conf/httpd.conf

# Redirect logs to stdout/stderr (container best practice)
RUN sed -i 's|ErrorLog "logs/error_log"|ErrorLog /dev/stderr|' /etc/httpd/conf/httpd.conf && \
    sed -i 's|CustomLog "logs/access_log" combined|CustomLog /dev/stdout combined|' /etc/httpd/conf/httpd.conf

# Fix permissions for all directories httpd needs
RUN chgrp -R 0 /var/log/httpd /var/run/httpd /etc/httpd/logs && \
    chmod -R g+rwx /var/log/httpd /var/run/httpd && \
    chown -R apache:0 /var/www/parts && \
    chmod -R 755 /var/www/parts

USER apache

EXPOSE 8080

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
