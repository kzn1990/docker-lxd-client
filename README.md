# Docker LXD Client
This project contains a Dockerfile for building a Docker image that contains the lxc command-line tool. 
Installing the lxd client in docker with snap is not possible, so you have to compile from source.
The project is very useful if you need to perform operations on lxd hosts from docker/pipeline

The Dockerfile uses arguments `GOLANG_VERSION`, `UBUNTU_VERSION` and `LXD_VERSION` to customize the versions.

The project also contains a pipeline in GitHub Actions that is configured to run daily using a schedule. The pipeline builds the Docker image from the `Dockerfile` and pushes the `latest` tag to [kzn1990/lxd-client](https://hub.docker.com/r/kzn1990/lxd-client) on Docker Hub.

# Requirements
To build the Docker image from this Dockerfile, you need the following:

- Docker

# Usage
To build the Docker image, run the following command in the root directory of the project:

```
docker build \
  --build-arg GOLANG_VERSION=1.20rc1 \
  --build-arg UBUNTU_VERSION=22.04 \
  --build-arg LXD_VERSION=latest \
  -t my-lxc:latest \
  .
```
The command above will build a Docker image named `my-lxc:latest` using the specified versions of Go, Ubuntu, and lxc. You can then run the image using the docker run command, e.g. `docker run -it --rm my-lxc:latest lxc --version`.
