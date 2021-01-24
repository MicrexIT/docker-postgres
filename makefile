help:
	@echo "build        - Build a database container for local development."
	@echo "up        - Run database container for local development."
	@echo "stop       - Stop and remove database container (data is not removed)."
	@echo ""
	@echo "restore    - Restore from backup (storage container must exist)."
	@echo ""
	@echo "psql       - run a postgresql shell against a running container."
	@echo "             The following arguments can be passed to this target:"
	@echo "             user=myusername; username used to connect to database"
	@echo "             db=mydb;         name of database to connect to"

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

start:
	docker-compose -f docker-compose.yml start

down:
	docker-compose -f docker-compose.yml down

destroy:
	docker-compose -f docker-compose.yml down -v

stop:
	docker-compose -f docker-compose.yml stop

restart:
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml up -d
ps:
	docker-compose -f docker-compose.yml ps

# default args for psql
user = user
db = blend
db-shell:
	docker-compose -f docker-compose.yml exec postgres psql -U $(user) -d $(db)