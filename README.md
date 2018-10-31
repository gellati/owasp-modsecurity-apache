### Apache server with modsecurity

This repo hosts files for the attempt to set up an Apache server with ModSecurity in a Docker container.

Clone the repo and go into the directory.

The docker container can be built with

    docker build -t owasp .

This builds the container based on the Dockerfile. owasp is just a tag name which can be replaced with any other string.

Run the container with

    docker run -it -p 80:80 owasp

The -p switch maps the container's port to the port on the host machine running the container.
