#!/usr/bin/make

.PHONY : all serve publish clean

all: serve

install: hugo

hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz hugo
	touch hugo
	mkdir -p ~/bin
	ln -sfr hugo ~/bin/

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

serve: hugo
	hugo server --disableFastRender

publish: clean
	git add -u

clean:
	find . -name '*~' -o -name '*.bak' -delete

update-theme:
	git submodule update --remote --merge --depth 1
