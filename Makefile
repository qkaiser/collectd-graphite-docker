all: collectd pull build run

pull:
	@docker pull mackerel/graphite

build:
	$(eval TMP := $(shell docker run -d --name graphite -v /tmp/log:/var/log/graphite -v /tmp/whisper:/var/lib/graphite/storage/whisper -p 8000:8000 -p 2003:2003 -p 2004:2004 mackerel/graphite))
	@touch .id
	@echo "$(TMP)" > .id

run:
	@docker start $(shell cat .id)
	@echo "Open your browser and go to http://localhost:8000/ to open Graphite UI."

collectd:
	apt-get install -y collectd
	cp collectd.conf /etc/collectd/collectd.conf
	service collectd restart

clean-container:
	#I know, this is HARDCORE
	docker ps -a | grep "mackerel/graphite" | awk '{print $1}' | xargs --no-run-if-empty sudo docker rm -f

clean-collectd:
	apt-get remove -y collectd

clean: clean-container clean-collectd
