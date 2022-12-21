require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'

include ::Asciidoctor

class LinkInPumlMacro < Extensions::InlineMacroProcessor
  use_dsl
  named :'link-in-puml'

  def process parent, target, attrs

    anchor = parent.apply_subs("xref:#{target}[]", [:macros])

    # parse the anchor
    matches = anchor.match(%r{^<a href="(?<href>.+?)"[^>]*>(?<text>.*)</a>$})

    if matches
      # matched, output the href
      create_inline(parent, :quoted, matches[:href])
    else
      # no match, output the target as-is
      create_inline(parent, :quoted, target)
    end

  end
end
