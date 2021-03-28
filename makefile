DIR := ${CURDIR}

build:
	docker build -t prolog .

run:
	docker run --rm --mount type=bind,source=$(DIR)/db,target=/app/db -it prolog 

build-run:
	docker build -t prolog . && \
	docker run --rm --mount type=bind,source=$(DIR)/db,target=/app/db -it prolog