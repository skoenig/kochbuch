#!/usr/bin/make

.PHONY: all
all: serve

.PHONY: serve
serve: bin/hugo themes/congo/theme.toml
	bin/hugo server --disableFastRender

.PHONY: test
test: bin/hugo bin/htmltest
	rm -fr public/
	bin/hugo --minify
	bin/htmltest

.PHONY: publish
publish: clean test
	git add -u

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.bak' -delete

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

bin/hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz -C bin/ hugo && touch bin/hugo

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

themes/congo/theme.toml:
	git submodule update --remote --init
