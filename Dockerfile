#
# mysql
#

FROM ubuntu
MAINTAINER dusty@clarkda.com

# Update our repositories
RUN apt-get update

# ..
RUN apt-get -y install apache2 libapache2-mod-php5 php5-mysql

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]