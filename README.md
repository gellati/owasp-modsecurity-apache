# Apache server with modsecurity

This repo hosts files for the attempt to set up an Apache server with ModSecurity in a Docker container. Using [OWASP](https://www.owasp.org/index.php/Main_Page), the [3.0 rule set](https://github.com/SpiderLabs/owasp-modsecurity-crs).

## Setup

Clone the repo and go into the directory.

The docker container can be built with

    docker build -t owasp .

This builds the container based on the Dockerfile. owasp is just a tag name which can be replaced with any other string.

Run the container with

    docker run -it -p 80:80 owasp

The `-p` switch maps the container's port to the port on the host machine running the container.

In the Dockerfile the line

    RUN /usr/sbin/httpd -D FOREGROUND

starts the container. The page served by the Apache server can with a web browser be seen at `170.17.0.2`. The address for the container can be found with `ifconfig` at the command line.

In order to log into the container immediately upon startup, replace the above command with

    RUN httpd -t

In this case the container will shut down when it is exited. The server however does not start due to a D-Bus error.

## Testing

The file `attacks.sh` contains a number of attacks that can be performed on a webserver. In order to run the attacks, uncomment the desired ones, and then execute them with

    ./attacks.sh

Examine the results by logging into the container with

    docker exec -it <container_name> /bin/bash

The name of the running container can be found with the command

    docker ps

The results can be seen in the error log of the Apache server in `/etc/httpd/logs/error_log`.

The sensitivity of ModSecurity to detect an attack can be set by adjusting the `paranoia_level` parameter in the `crs-setup.conf` file.



## Observations

- make sure modsecurity configuration file is called `mod_security.conf`. Notice the underscore.

- place rule files in `activated_rules` directory

- todo: why is page not seen at 170.17.0.1, the url given by `ifconfig`?
