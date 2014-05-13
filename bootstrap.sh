#!/bin/bash

cat << EOF

 _   _               _                 
(_) | |_____ _____  | |__ _ _ __  _ __ 
| | | / _ \ V / -_) | / _\` | '  \| '_ \
|_| |_\___/\_/\___| |_\__,_|_|_|_| .__/
                                 |_|                                           

EOF

# ..

set_env () {
	while [ -z "${server_name}" ]; do
	        read -p "server name : " temp_server_name
	        if [ ! -z ${temp_server_name} ]; then
	        	server_name=temp_server_name
	        fi
	done	

	save_env
}

# ..

save_env () {
	while true; do
	    read -p $'\n'"save and build docker image? y/n " yn $'\n'
	    case $yn in
	        [Yy]* ) create_persist_volumes; break;;
	        [Nn]* ) exit;;
	        * ) echo "[y]es or [n]o";;
	    esac
	done
}

# ..

create_persist_volumes () {
	mkdir -p /var/docker/${server_name}/etc/apache2/sites-enabled &&
	mkdir -p /var/docker/${server_name}/var/log/apache2 &&
	mkdir -p /var/docker/${server_name}/var/www &&
	echo "<? echo 'Hello World!' ?>" >> /var/dockeer/${server_name}/var/www/index.php &&
	build_image_start_container
}

# ..

build_image_start_container () {
	docker.io build -t dusty/${server_name} github.com/clarkda/docker-lamp.git &&
	docker.io run -d -p 80:80 \
		-v /var/docker/${server_name}/etc/apache2/sites-enabled/:/etc/apache2/sites-enabled \
		-v /var/docker/${server_name}/var/www/:/var/www \
		-v /var/docker/${server_name}/var/log/apache2/:/var/log/apache2 dusty/${server_name}
}

# ..

set_env