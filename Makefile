.PHONY: help
help:
	@echo Help

.PHONY: update_contrib
update_contrib:
	rm -rf contrib/samba
	mkdir contrib/samba
	wget -qO - https://github.com/dperson/samba/archive/master.tar.gz | tar -xz --strip 1 -C contrib/samba

.PHONY: uninstall
uninstall:
	-rm -rf /opt/krause-hausordner/
	-rm -f /etc/systemd/system/docker-hausordner.service

.PHONY: install
install: uninstall
	mkdir -p /opt/krause-hausordner
	cp -r docker-compose.yml bargate contrib .env /opt/krause-hausordner/
	cp docker-hausordner.service /etc/systemd/system/docker-hausordner.service
	cd /opt/krause-hausordner; docker-compose build

