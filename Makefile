.PHONY: install lint test all serve clean help

HUGO_VERSION=0.145.0

.DEFAULT_GOAL := help

install: bin/hugo bin/htmltest ## Install dependencies

test: install  ## Run tests
	rm -fr public/
	bin/hugo --minify
	bin/htmltest

all: serve

serve: install  ## Start local server
	bin/hugo server --disableFastRender

publish: clean test  ## Prepare publishing
	sed -i "s/hugo-version:.*$$/hugo-version: $(HUGO_VERSION)/" .github/workflows/gh-pages.yml
	git add -u

clean:	## Clean temporary files
	find . -name '*~' -o -name '*.bak' -delete

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash
	chmod +x bin/htmltest

bin/hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz -C bin/ hugo && touch bin/hugo

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

static/img/%.webp: assets/%.jpg  ## Create webp images from jpg sources
	exiftran -ai $<
	cwebp -alpha_cleanup on -quiet -q 85 $< -o $@

help:  ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
