FROM docker:17.07 as dockerbuilder

FROM golang:1.8-stretch

ENV BUILDDIR=/usr/image/build

RUN apt-get update
RUN apt-get install -y git

# Required by linuxkit to generate raw images
RUN apt-get install qemu-kvm

RUN go get -u github.com/moby/tool/cmd/moby
RUN go get -u github.com/linuxkit/linuxkit/src/cmd/linuxkit

WORKDIR $BUILDDIR
RUN mkdir -p $BUILDDIR

COPY --from=dockerbuilder /usr/local/bin/docker /usr/bin/docker
RUN chmod +x /usr/bin/docker

CMD ["moby"]
