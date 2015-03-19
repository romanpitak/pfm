# PFM

Load modules

    marked = require 'marked'
    Renderer = require './Renderer'

## Renderer

    renderer = new Renderer

### Use the new renderer

    marked.setOptions
        renderer: renderer

## Expose

    module.exports = marked
