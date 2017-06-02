#!/usr/bin/make

.PHONY : all serve publish publish-gh-pages

SOURCES = $(shell find . -name '*.md')

all : _build

_build : $(SOURCES)
	python -m urubu build

serve : _build
	tserve --prefix kochbuch _build

publish : _build
	rsync -acP --delete _build/ uberspace:/var/www/virtual/skoenig/html/kochbuch/

publish-gh-pages : _build
	./publish-gh-pages.sh

