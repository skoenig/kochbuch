#!/usr/bin/make

.ONESHELL :

.PHONY: all
all: serve

install: hugo cook

hugo: /tmp/hugo.tar.gz
	tar xf /tmp/hugo.tar.gz hugo
	touch hugo
	mkdir -p ~/bin
	ln -sfr hugo ~/bin/

/tmp/hugo.tar.gz:
	wget https://github.com/gohugoio/hugo/releases/download/v0.96.0/hugo_0.96.0_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz

/tmp/cook:
	wget https://github.com/cooklang/CookCLI/archive/refs/heads/main.zip -O /tmp/cook.zip
	unzip /tmp/cook.zip -d /tmp/cook

cook: /tmp/cook
	# this can be replaced with a simple binary download once CookCLI [v0.2.0](https://github.com/cooklang/CookCLI/milestone/1) is released
	cd /tmp/cook/CookCLI-main/
	docker build -t cook-builder .
	docker run  --volume $$PWD:/src --workdir /src --entrypoint swift -it cook-builder build --configuration release -Xswiftc -static-executable
	cd -
	cp /tmp/cook/CookCLI-main/.build/x86_64-unknown-linux-gnu/release/cook .


compile: $(subst recipes,content,$(subst .cook,.md,$(wildcard recipes/*/*.cook)))
content/%.md:recipes/%.cook
	./cook recipe read --output-format=markdown recipes/$*.cook \
		| sed -e 's|^## Ingredients|## Zutaten|;
				  s|^## Cookware|## Zubehör|;
				  s|^## Steps|## Zubereitung|;
				  s|\ minutes\ |\ Minuten\ |' > $@

.PHONY: serve
serve: hugo compile
	hugo server --disableFastRender

.PHONY: publish
publish: clean compile
	git add -u

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.bak' -delete

update-theme:
	git submodule update --remote --merge --depth 1
