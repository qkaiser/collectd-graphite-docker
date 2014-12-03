all: pull build run

pull:
	@docker pull mackerel/graphite

build:
	$(eval TMP := $(shell docker run -d --name graphite -v /tmp/log:/var/log/graphite -v /tmp/whisper:/var/lib/graphite/storage/whisper -p 8000:8000 -p 2003:2003 -p 2004:2004 mackerel/graphite))
	@touch .id
	@echo "$(TMP)" > .id

run:
	@docker start $(shell cat .id)

collectd:
	apt-get install -y collectd
	cp collectd.conf /etc/collectd/collectd.conf
	service collectd restart
