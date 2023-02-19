#!/usr/bin/make

HUGO_VERSION=0.110.0

.PHONY: all
all: serve

.PHONY: serve
serve: bin/hugo themes/congo/theme.toml
	bin/hugo server --disableFastRender

.PHONY: test
test: bin/hugo bin/htmltest
	rm -fr public/
	bin/hugo --minify
	bin/htmltest

.PHONY: publish
publish: clean test
	sed -i "s/hugo-version:.*$$/hugo-version: $(HUGO_VERSION)/" .github/workflows/gh-pages.yml
	git add -u

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.bak' -delete

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

bin/hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz -C bin/ hugo && touch bin/hugo

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

themes/congo/theme.toml:
	git submodule update --remote --init

static/img/%.webp: assets/%.jpg
	exiftran -ai $<
	cwebp -alpha_cleanup on -quiet -q 85 $< -o $@
