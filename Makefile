
srcDir = src
outDir = lib

srcFiles = $(wildcard $(srcDir)/*.litcoffee)
outFiles = $(patsubst $(srcDir)/%.litcoffee, $(outDir)/%.js, $(srcFiles))

node=iojs
coffee = $(node) ./node_modules/.bin/coffee
coffeelint = $(node) ./node_modules/.bin/coffeelint

.PHONY: all clean test lint

all: $(outFiles)

$(outDir)/%.js: $(srcDir)/%.litcoffee node_modules
	@mkdir -p $(@D)
	$(coffee) --print --compile $< >$@

node_modules: package.json
	npm install
	@touch $@

test: lint

lint: node_modules $(srcFiles)
	$(coffeelint) $(srcFiles)

clean:
	rm --recursive --force -- $(outDir)
	rm --recursive --force -- node_modules
