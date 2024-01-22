LOGIN = mviudes
PATH_VOLUME =  /home/$(LOGIN)/data

MKDIR = mkdir -p
YAML = ./srcs/docker-compose.yml
RM = rm -rf

.PHONY: all clean re
all:
	$(MKDIR) $(PATH_VOLUME)/wp-database
	$(MKDIR) $(PATH_VOLUME)/wp-website

	docker-compose -f ${YAML} up --build -d

clean:
	docker-compose -f ${YAML} stop 

fclean: clean
	docker system prune -af
	docker volume rm $$(docker volume ls -q)  -f 2>/dev/null || true
	docker network rm $$(docker network ls -q) -f 2>/dev/null || true
	docker volume prune -f

run:
	docker-compose -f ${YAML} up -d 

re: fclean
	$(RM) $(PATH_VOLUME)/wp-database
	$(RM) $(PATH_VOLUME)/wp-website
	$(MKDIR) $(PATH_VOLUME)/wp-database
	$(MKDIR) $(PATH_VOLUME)/wp-website
	docker-compose -f ${YAML} up -d
