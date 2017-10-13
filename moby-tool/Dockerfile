FROM docker:17.07 as dockerbuilder

FROM golang:1.8-alpine

ENV BUILDDIR=/usr/image/build

RUN apk update
RUN apk add git

RUN go get -u github.com/moby/tool/cmd/moby
RUN go get -u github.com/linuxkit/linuxkit/src/cmd/linuxkit

WORKDIR $BUILDDIR
RUN mkdir -p $BUILDDIR

COPY --from=dockerbuilder /usr/local/bin/docker /usr/bin/docker
RUN chmod +x /usr/bin/docker

CMD ["moby"]
