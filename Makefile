all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  This is merely a base image for usage read the README file
	@echo ""   1. make run       - build and run docker container

build: builddocker beep

run: STEAM_USERNAME STEAM_PASSWORD ip builddocker rundocker beep

debug: STEAM_USERNAME STEAM_PASSWORD ip builddocker debugdocker

rundocker:
	$(eval TMP := $(shell mktemp -d --suffix=DOCKERTMP))
	$(eval NAME := $(shell cat NAME))
	$(eval TAG := $(shell cat TAG))
	$(eval STEAM_USERNAME := $(shell cat STEAM_USERNAME))
	$(eval STEAM_PASSWORD := $(shell cat STEAM_PASSWORD))
	$(eval IP := $(shell cat IP))
	$(eval TARGET_IP := $(shell cat TARGET_IP))
	$(eval SERVER_PASSWORD := $(shell cat SERVER_PASSWORD))
	chmod 777 $(TMP)
	@docker run --name=$(NAME) \
	-it \
	-d \
	--cidfile="cid" \
	-v $(TMP):/tmp \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
	-v /exports/gamedata/7dtd:/home/steamer/.local/share/ \
	-v /exports/serversettings/7dtd:/home/steamer/7DaysToDie/ \
	-v /home/steamer/.steam/:/home/steamer/.steam \
	-p $(IP):26900:26900/tcp \
	-p $(IP):26900:26900/udp \
	-p $(IP):26901:26901/udp \
	-p $(IP):26902:26902/udp \
	-p $(IP):10080:8080/tcp \
	-p $(IP):10081:8081/tcp \
	-p $(IP):10082:8082/tcp \
	--env STEAM_USERNAME=${STEAM_USERNAME} \
	--env STEAM_PASSWORD=${STEAM_PASSWORD} \
	-t thalhalla/7daystodie

debugdocker:
	$(eval TMP := $(shell mktemp -d --suffix=DOCKERTMP))
	$(eval NAME := $(shell cat NAME))
	$(eval TAG := $(shell cat TAG))
	$(eval STEAM_USERNAME := $(shell cat STEAM_USERNAME))
	$(eval STEAM_PASSWORD := $(shell cat STEAM_PASSWORD))
	$(eval IP := $(shell cat IP))
	$(eval TARGET_IP := $(shell cat TARGET_IP))
	$(eval SERVER_PASSWORD := $(shell cat SERVER_PASSWORD))
	chmod 777 $(TMP)
	@docker run --name=$(NAME) \
	--cidfile="cid" \
	-v $(TMP):/tmp \
	-it \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
	-v /exports/gamedata/7dtd:/home/steamer/.local/share/ \
	-v /exports/serversettings/7dtd:/home/steamer/7DaysToDie/ \
	-v /home/steamer/.steam/:/home/steamer/.steam \
	-p $(IP):26900:26900/tcp \
	-p $(IP):26900:26900/udp \
	-p $(IP):26901:26901/udp \
	-p $(IP):26902:26902/udp \
	-p $(IP):10080:8080/tcp \
	-p $(IP):10081:8081/tcp \
	-p $(IP):10082:8082/tcp \
	--env STEAM_USERNAME=${STEAM_USERNAME} \
	--env STEAM_PASSWORD=${STEAM_PASSWORD} \
	-t thalhalla/7daystodie \
	/bin/bash

builddocker:
	/usr/bin/time -v docker build -t thalhalla/7daystodie .

beep:
	-@echo "beep"
	-@aplay /usr/share/sounds/alsa/Front_Center.wav

kill:
	-@docker kill `cat cid`

rm-steamer:
	rm  steamer.txt

rm-image:
	-@docker rm `cat cid`
	-@rm cid

cleanfiles:
	-@rm STEAM_USERNAME
	-@rm STEAM_PASSWORD

rm: kill rm-image

clean: cleanfiles rm

enter:
	docker exec -i -t `cat cid` /bin/bash

logs:
	docker logs -f `cat cid`

STEAM_USERNAME:
	@while [ -z "$$STEAM_USERNAME" ]; do \
		read -r -p "Enter the steam username you wish to associate with this container [STEAM_USERNAME]: " STEAM_USERNAME; echo "$$STEAM_USERNAME">>STEAM_USERNAME; cat STEAM_USERNAME; \
	done ;

steam_guard_code:
	@while [ -z "$$STEAM_GUARD_CODE" ]; do \
		read -r -p "Enter the steam guard code you wish to associate with this container [STEAM_GUARD_CODE]: " STEAM_GUARD_CODE; echo "$$STEAM_GUARD_CODE">>steam_guard_code; cat steam_guard_code; \
	done ;

STEAM_PASSWORD:
	@while [ -z "$$STEAM_PASSWORD" ]; do \
		read -r -p "Enter the steam password you wish to associate with this container [STEAM_PASSWORD]: " STEAM_PASSWORD; echo "$$STEAM_PASSWORD">>STEAM_PASSWORD; cat STEAM_PASSWORD; \
	done ;

ip:
		@while [ -z "$$IP" ]; do \
			read -r -p "Enter the IP address you wish to associate with this container [IP]: " IP; echo "$$IP">>ip; cat ip; \
		done ;

smoke:
	@-echo '<======~'
