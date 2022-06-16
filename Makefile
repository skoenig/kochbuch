#!/usr/bin/make

.PHONY: all
all: serve

install: hugo

hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz hugo
	touch hugo
	mkdir -p ~/bin
	ln -sfr hugo ~/bin/

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

.PHONY: serve
serve: hugo
	hugo server --disableFastRender

.PHONY: publish
publish: clean test
	git add -u

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.bak' -delete

.PHONY: test
test: hugo bin/htmltest
	rm -fr public/
	hugo --minify
	bin/htmltest

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

update-theme:
	git submodule update --remote --merge --depth 1
