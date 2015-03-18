
coffee = ./node_modules/.bin/coffee

.PHONY: all clean

all: lib/pfm.js

lib/pfm.js: src/pfm.litcoffee node_modules
	@mkdir -p $(@D)
	$(coffee) --print --compile $< >$@

node_modules: package.json
	npm install
	@touch $@

clean:
	rm --recursive --force -- lib
	rm --recursive --force -- node_modules
