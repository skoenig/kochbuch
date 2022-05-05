#!/usr/bin/make

.PHONY : all serve publish install clean
SOURCES = $(shell find ./content -name '*.md')
IMAGES = $(shell find ./static/img -name '*.jpg')
projectname = $(notdir $(shell pwd))

all: serve

install:
	wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz
	mkdir -p ~/bin
	tar xf /tmp/hugo.tar.gz -C ~/bin hugo

serve:
	hugo server --disableFastRender

publish: clean
	git add -u

clean:
	find . -name '*.bak' -delete

update-theme:
	git submodule update --remote --merge --depth 1
