#!/usr/bin/make

.PHONY : all serve publish install clean
SOURCES = $(shell find . -name '*.md')
projectname = $(notdir $(shell pwd))

all : _build

install:
	pip3 install -r requirements.txt

_build : $(SOURCES)
	python3 -m urubu build

serve : _build
	python3 -m urubu serveany

publish : _build
	rm -rf docs
	cp -a _build docs
	git add docs

clean:
	rm -fr _build
	find . -name '*.bak' -delete
