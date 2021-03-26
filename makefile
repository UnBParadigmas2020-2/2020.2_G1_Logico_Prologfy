build:
	docker build -t prolog .

run:
	docker run -it prolog

build-run:
	docker build -t prolog . && docker run -it prolog