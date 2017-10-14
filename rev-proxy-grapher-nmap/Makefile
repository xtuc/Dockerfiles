NAME=rev-proxy-grapher-nmap

build:
	docker build \
		-t $(NAME) \
		.


test:
	docker run \
	  --net=host \
	  -v ${CURDIR}/data:/tmp \
	  $(NAME) \
	  topology.yaml

test-with-nmap:
	docker run \
	  --net=host \
	  -e USE_NMAP=true \
	  -v ${CURDIR}/data:/tmp \
	  $(NAME) \
	  topology.yaml \
	  192.168.1.1/24
