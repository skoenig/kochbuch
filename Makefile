
all: build

build:
	python -m urubu build

serve:
	tserve --prefix kochbuch _build

publish: build
	rsync -acP --delete _build/ /home/skoenig/Dropbox/Public/kochbuch/

publish-gh-pages: build
	./publish-gh-pages.sh

