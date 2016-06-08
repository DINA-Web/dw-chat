RND := $(shell < /dev/urandom LC_ALL=C tr -cd [:alnum:] | head -c32)

all: up

up:
	docker-compose up -d

init:
	@echo $(RND)
	sed -s 's/long-and-random-alphanumeric-string/$(RND)/g' \
		docker-compose.yml > docker-compose.prod.yml

clean: stop rm

stop:
	docker-compose stop

rm:
	docker-compose rm -vf

