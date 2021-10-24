IMAGE_NAME = mars

.PHONY: docker-build 
docker-build:
	docker build --tag mars .

.PHONY: docker-run 
docker-run: | docker-build
	docker run \
		--detach \
		--env DISPLAY=$$DISPLAY \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		$(IMAGE_NAME)

.PHONY: docker-kill 
docker-kill:
	docker stop $$(docker ps | awk -v i="^$(IMAGE_NAME).*" '{if($$2~i){print$$1}}')

.PHONY: bash-into-docker
bash-into-docker:
	docker run \
    	--interactive \
		--tty \
    	--rm \
    	--entrypoint bash \
		$(IMAGE_NAME)
