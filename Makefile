CONTAINER=ferimer/clamd:latest

update_base:
	docker pull alpine:latest

build: update_base
	docker build -t ${CONTAINER} . 

run: build
	docker run --rm -p 3310:3310 ${CONTAINER}

publish: build
	docker push ${CONTAINER}
