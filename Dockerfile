FROM debian:11

RUN apt update && \
    apt install -y apache2 apache2-utils libapache2-mod-jk && \ 
    apt clean

COPY conf/ajp-proxy.conf /etc/apache2/sites-available/ajp-proxy.conf

RUN a2enmod proxy_ajp && a2enmod proxy_http && \
    ln -s /etc/apache2/sites-available/ajp-proxy.conf /etc/apache2/sites-enabled/ajp-proxy.conf

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]