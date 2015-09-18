
all: build

build:
	python -m urubu build

serve:
	tserve --prefix kochbuch _build

publish:
	rsync -acP --delete _build/ /home/skoenig/Dropbox/Public/kochbuch/
