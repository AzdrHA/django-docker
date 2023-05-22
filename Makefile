start:
	@docker-compose up

stop:
	@docker-compose down

enter:
	@docker-compose exec python_api sh

build:
	@docker-compose build