#!/usr/bin/make

.PHONY : all serve publish 
SOURCES = $(shell find . -name '*.md')
projectname = $(notdir $(shell pwd))

all : _build

_build : $(SOURCES)
	python -m urubu build

serve : _build
	tserve --prefix kochbuch _build

publish : _build
	rm -rf docs
	cp -a _build docs
	git add docs

