#
# ..lamp
#

FROM ubuntu
MAINTAINER dusty@clarkda.com

# Update our repositories
RUN apt-get update

# ..
RUN apt-get install supervisor apache2 libapache2-mod-php5 php5-mysql -y

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]