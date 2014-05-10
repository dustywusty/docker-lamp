#
# ..lamp
#

FROM ubuntu
MAINTAINER dusty@clarkda.com

# Update our repositories
RUN apt-get update

# ..
RUN apt-get install apache2 libapache2-mod-php5 php5-mysql -y

RUN a2enmod php5

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]