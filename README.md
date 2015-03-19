# Piták Flavored Markdown (parser)

This module alters the `marked` module to my liking.

## Changes

- `options.highlight` is disabled (too lazy to implement)
- highlighting is done by [`pygmentize`](http://pygments.org)
- In paragraphs, `~` renders to `&nbsp;`
- In inline code, `~` renders to `&Tilde;`
