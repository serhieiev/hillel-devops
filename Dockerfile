FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean -y
RUN useradd -ms /bin/bash hillel_devops
RUN sed -i 's/Listen 80[[:space:]]*$/Listen 8080/' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf
COPY index.html /var/www/html/index.html
EXPOSE 8080 
CMD ["apache2ctl", "-D", "FOREGROUND"]