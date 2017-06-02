#!/usr/bin/make

.PHONY : all serve publish publish-gh-pages
SOURCES = $(shell find . -name '*.md')
projectname = $(notdir $(shell pwd))

all : _build

_build : $(SOURCES)
	python -m urubu build

serve : _build
	tserve --prefix kochbuch _build

publish : _build
	rsync -acP --delete _build/ uberspace:/var/www/virtual/skoenig/html/$(projectname)/

publish-gh-pages : _build
	./publish-gh-pages.sh

