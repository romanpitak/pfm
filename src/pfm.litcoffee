# PFM

Load modules

    marked = require 'marked'
    {execSync} = require 'child_process'

## Renderer

    renderer = new marked.Renderer

### Code

To use `pygmentize` we need to rewrite the `renderer.code` method
instead of `renderer.options.highlight`
because `renderer.code` wraps the highlihter result
in unnecessary `<pre><code>`.
Sync renderer methods require `child_process.execSync`.

    renderer.code = (code, lexer = 'text') ->
        try
            result = execSync "pygmentize -l #{lexer} -f html",
                input: code
        catch err
            codeClass = "\"#{this.options.langPrefix}#{escape(lexer, true)}\""
            return "<pre><code class=#{codeClass}>#{code}</code><pre>"
        return result.toString()

### Codespan

We need to replace `~` in paragraphs with `&Tilde;`
so that it doesn't get replaced by `&nbsp;` in paragraph.

    renderer.codespan = (text) ->
        return "<code>#{text.replace /~/g, '&Tilde;'}</code>"

### Paragraph

Replace `~` with `&nbsp;`

    renderer.paragraph = (text) ->
        return "<p>#{text.replace /~/g, '&nbsp;'}</p>\n"

### Use the new renderer

    marked.setOptions
        renderer: renderer

## Expose

    module.exports = marked
