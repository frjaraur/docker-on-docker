build:
	docker build -t dond .

start:
	docker run --privileged --name dond -d -p 12375:2375 dond

test:
	docker -H tcp://0.0.0.0:12375 run -d alpine ping www.google.es

status:
	docker -H tcp://0.0.0.0:12375 ps 

cluster:
	@docker network create dod || true
	@for I in 1 2 3 4; do echo "Starting container dod$$I";docker run -e DOCKER_HOST=0.0.0.0:2375 --privileged -p 808$$I:8080 --net=dod --name dod$$I -d dond;done

cluster_clean:
	@for I in 1 2 3 4; do echo "Removing container dod$$I";docker rm -fv dod$$I ;done
	@docker network rm dod || true
