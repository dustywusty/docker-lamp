docker-lamp
==============

## Install Docker (Linode) Ubuntu 14.04

~~~
apt-get update
apt-get install docker.io
~~~

## Install docker-lamp

##### I personally like a shorter alias

~~~
echo 'alias d=docker.io' >> .profile
source ~/.profile
~~~

##### Add a few directories for our conf, logs, and www data

~~~
mkdir -p /var/docker/mysite/etc/apache2/sites-enabled
mkdir -p /var/docker/mysite/var/log/apache2
mkdir -p /var/docker/mysite/var/www
~~~

##### Build our docker image

~~~
d build -t dusty/mysite github.com/clarkda/docker-lamp.git
~~~

##### Start a container, expose port 80, and attach our persistent directories

~~~
d run -d -p 80:80 \
-v /var/docker/mysite/etc/apache2/sites-enabled/:/etc/apache2/sites-enabled \
-v /var/docker/mysite/var/www/:/var/www \
-v /var/docker/mysite/var/log/apache2/:/var/log/apache2 dusty/mysite
~~~

todo
==============
* can i variabilize container creation to do more grunt work for me?
* ??