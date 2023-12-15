LOGIN = mviudes
PATH_VOLUME =  /home/$(LOGIN)/data

MKDIR = mkdir -p

.PHONY: all clean re
all:
	$(MKDIR) $(PATH_VOLUME)/wp-database
	$(MKDIR) $(PATH_VOLUME)/wp-website
	docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	docker-compose stop 
re:
	docker-compose -f 
