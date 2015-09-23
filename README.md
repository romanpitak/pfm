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

### Integration ###

#### with [Jade](http://jade-lang.com) >= 1.10.0 #####

Use the [`jstransformer-pfm`](https://www.npmjs.com/package/jstransformer-pfm) module.

[Jade deprecated Transformers](http://jade-lang.com/history/#1-10-0-2015-05-25) support in filters in v1.10.0
and will be dropping it in favor of `jstransformers` from v2.0.0.

#### with [Jade](http://jade-lang.com) < 1.10.0 ####

```coffeescript
jade = require 'jade'
pfm = require 'pfm'
jade.filters.markdown = pfm
```

### Real life example ###

I was recently editing [my /about page](http://pitak.net/about) when I discovered this peculiar piece of jade:

```jade
p.
    Written in&nbsp;the&nbsp;#[a(href='http://jade-lang.com', target='_blank') jade template engine]
    with&nbsp;#[a(href='http://sass-lang.com/', target='_blank') Sass]
    and&nbsp;#[a(href='http://coffeescript.org/#literate', target='_blank') literate CoffeScript].
    The&nbsp;design is based on&nbsp;the&nbsp;#[a(href='http://lanyon.getpoole.com/', target='_blank') Lanyon]
    theme for&nbsp;#[a(href='http://jekyllrb.com/', target='_blank') Jekyll]
    , but rewritten from&nbsp;scratch in&nbsp;Sass.  The&nbsp;page and&nbsp;blog builder runs
    in&nbsp;#[a(href='http://nodejs.org/', target='_blank') Node.js]
    and&nbsp;the&nbsp;whole site is put together
    by&nbsp;the&nbsp;#[a(href='http://www.gnu.org/software/make/', target='_blank') GNU Make].
```

It needed to be written like that to produce the desired output (links to outside sources open in a new tab and line splitting behaves nicely). When I rewrote it with the `:pfm` filter, well - judge for yourself:

```jade
:pfm
    Written in~the~[jade template engine](http://jade-lang.com)
    with~[Sass](http://sass-lang.com/)
    and~[literate CoffeScript](http://coffeescript.org/#literate).
    The~design is based on~the~[Lanyon](http://lanyon.getpoole.com/)
    theme for~[Jekyll](http://jekyllrb.com/),
    but rewritten from~scratch in~Sass. The~page and~blog builder runs
    in~[Node.js](http://nodejs.org/)
    and~the~whole site is put together
    by~the~[GNU Make](http://www.gnu.org/software/make/).
```

With or without highlighting, the below `:pfm` code is easier to read. And readability counts.


## I love you

[Roman Piták](http://pitak.net) made this. Ping me on Twitter —
[@RomanPitak](https://twitter.com/RomanPitak) — if you're having issues, want me to
merge in your pull request, or are using `:pfm` in a cool way. I'm kind of hoping
this is generic enough that people do some fun things with it.

