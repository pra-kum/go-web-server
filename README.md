# go-web-server

## Info
This Go webserver compiles with Go version 1.12+.  

It exposes a web server on port 8080 and logs to STDOUT.  The port is configurable by setting the PORT environment variable.  

It only has one endpoint that returns status code 200: `/health`. All other requests will return 404: "404 page not found".  

## Instructions
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
It is assumed that "Git" and "Docker" are installed on your system.
If not, you may refer to the documentation on their respective websites mentioned below:
* https://git-scm.com
* https://www.docker.com

### Installation
Once the Docker is running, use the following commands to run the web server:

Get the code from GitHub:
```
$ git clone https://github.com/pra-kum/go-web-server.git
$ cd go-web-server
```

Build the docker image by running the following command:

```
$ docker build -t go-web-server .
```

Check if the image has been succefully listed under local docker repositories by running the following command:
```
$ docker images
```

### Running the web server in a docker container
Once the image has been built, use the following command to run the web server image as a container:
```
$ docker run --rm -p 8080:8080 go-web-server
```

Test the server by using following URL in your web browser:
* http://127.0.0.1:8080/health

To change the port on which the webserver runs, set the environment variable at runtime using the following command:
```
$ docker run --rm -e PORT=5000 -p 32761:5000 go-web-server
```

The above command runs the web server on port 5000 and makes it accessible to the host (or local computer) on port 32761.

Test again by using following URL in your web browser:
* http://127.0.0.1:32761/health

-----

### Additional commands
Explore various annotaions in the image labels by running the following sample command:
```
$ docker inspect --format "{{ index .Config.Labels \"org.opencontainers.image.vendor\"}}" go-web-server

```
