ARG GOLANG_VERSION=1.20rc1
ARG UBUNTU_VERSION=22.04
FROM golang:$GOLANG_VERSION as build

ARG LXD_VERSION=5.9
RUN go install -v -x github.com/lxc/lxd/lxc@lxd-$LXD_VERSION

FROM ubuntu:$UBUNTU_VERSION
COPY --from=build /go/bin/lxc /usr/local/bin/lxc
CMD ["lxc", "--version"]
