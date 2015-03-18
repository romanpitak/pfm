
coffee = ./node_modules/.bin/coffee
coffeelint = ./node_modules/.bin/coffeelint

.PHONY: all clean test lint

all: lib/pfm.js

lib/pfm.js: src/pfm.litcoffee node_modules
	@mkdir -p $(@D)
	$(coffee) --print --compile $< >$@

node_modules: package.json
	npm install
	@touch $@

test: lint

lint: src/pfm.litcoffee node_modules
	$(coffeelint) $<

clean:
	rm --recursive --force -- lib
	rm --recursive --force -- node_modules
