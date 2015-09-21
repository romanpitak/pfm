# Piták Flavored Markdown (parser) #

[![npm](https://img.shields.io/npm/v/pfm.svg)](https://www.npmjs.com/package/pfm)
[![npm](https://img.shields.io/npm/dt/pfm.svg)](https://www.npmjs.com/package/pfm)
[![Gemnasium](https://img.shields.io/gemnasium/romanpitak/pfm.svg)](https://www.npmjs.com/package/pfm)
[![npm](https://img.shields.io/npm/l/pfm.svg)](https://www.npmjs.com/package/pfm)

This module extends the [`marked`](https://www.npmjs.com/package/marked) module to my liking.

- highlighting is done by [`pygmentize`](http://pygments.org)
- In paragraphs, `~` renders to `&nbsp;`
- In inline code, `~` renders to `&Tilde;`
- Link to external hosts have `target="_blank"`
- [`options.highlight`](https://github.com/chjj/marked#highlight) is disabled (too lazy to implement)

### Installation ###

    npm install pfm

### Integrations ###

#### with [Jade](http://jade-lang.com) >= 1.10.0 #####

Use the [`jstransformer-pfm`](https://www.npmjs.com/package/jstransformer-pfm) module.

Jade deprecated Transformers support in filters in v1.10.0
and will be dopping it in favor of `jstransformers` from v2.0.0.

#### with [Jade](http://jade-lang.com) < 1.10.0 ####

```coffeescript
jade = require 'jade'
pfm = require 'pfm'
jade.filters.markdown = pfm
```
