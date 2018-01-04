VERSION=0.5.6-20180103

all: Dockerfile
	docker build --force-rm --no-cache -t net2o:latest -t net2o:${VERSION} .
