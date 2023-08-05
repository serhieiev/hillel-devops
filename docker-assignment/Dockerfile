FROM ubuntu:18.04
RUN apt-get update -y && apt-get install apache2, apache2-utils -y && apt-get clean -y &&\
    useradd -ms /bin/bash hillel_devops &&\
    sed -i 's/Listen 80[[:space:]]*$/Listen 8080/' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf
COPY index.html /var/www/html/index.html
EXPOSE 8080 
CMD ["apache2ctl", "-D", "FOREGROUND"]
