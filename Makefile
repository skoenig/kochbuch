
all: build

build:
	python -m urubu build

serve:
	python -m urubu serve

publish:
	rsync -acP --delete _build/ /home/skoenig/Dropbox/Public/kochbuch/
