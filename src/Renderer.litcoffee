# Renderer

load modules

    marked = require 'marked'
    {execSync} = require 'child_process'

## Renderer

    class Renderer extends marked.Renderer

### Blockquote

        blockquote: (quote) ->
            return "<blockquote>\n#{quote}</blockquote>\n"

### Code

To use `pygmentize` we need to rewrite the `renderer.code` method
instead of `renderer.options.highlight`
because `renderer.code` wraps the highlihter result
in unnecessary `<pre><code>`.
Sync renderer methods require `child_process.execSync`.

        code: (code, lexer = 'text') ->
            try
                result = execSync "pygmentize -l #{lexer} -f html",
                    input: code
            catch err
                codeClass = "#{this.options.langPrefix}#{escape(lexer, true)}"
                return "<pre><code class=\"#{codeClass}\">#{code}</code><pre>"
            return result.toString()

### Codespan

We need to replace `~` in paragraphs with `&Tilde;`
so that it doesn't get replaced by `&nbsp;` in paragraph.

        codespan: (text) ->
            return "<code>#{text.replace /~/g, '&Tilde;'}</code>"

### Paragraph

Replace `~` with `&nbsp;`

        paragraph: (text) ->
            return "<p>#{text.replace /~/g, '&nbsp;'}</p>\n"

## Expose

    module.exports = Renderer
