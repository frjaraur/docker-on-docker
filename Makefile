build:
	docker build -t dond .

start:
	docker run --privileged --name dond -d -p 12375:2375 dond

test:
	docker -H tcp://0.0.0.0:12375 run -d alpine ping www.google.es

status:
	docker -H tcp://0.0.0.0:12375 ps 
