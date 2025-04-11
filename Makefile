DIR="./srcs/docker-compose.yml"

up:
	@docker compose -f $(DIR) up --build -d

down:
	@docker compose -f $(DIR) down
	@sudo rm -rf /home/rpepi/data/mariadb/*
	@sudo rm -rf /home/rpepi/data/wordpress/*
fclean: down
	@docker system prune -af
	
