FROM alpine:3.5

WORKDIR /usr/ansible

RUN builddeps=' \
		python-dev \
		py2-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		openssh-client \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	$builddeps \
	&& pip install --upgrade pip \
	&& pip install \
		paramiko==1.17.0 \
		ansible===2.0.2.0 \
		six \
	&& apk del --purge $builddeps
