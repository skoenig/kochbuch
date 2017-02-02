
all: build

build:
	python -m urubu build

serve:
	tserve --prefix kochbuch _build

publish: build
	rsync -acP --delete _build/ uberspace:/var/www/virtual/skoenig/html/kochbuch/

publish-gh-pages: build
	./publish-gh-pages.sh

