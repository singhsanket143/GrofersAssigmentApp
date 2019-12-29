module ApplicationHelper
  require 'redcarpet'
  require 'redcarpet'
  require 'albino'

  class SyntaxRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      if language && !language.empty?
        Albino.colorize(code, language)
      else
        "<pre><code>#{code}</code></pre>"
      end
    end
  end

  def markdown(text)
    options = {
        filter_html: true,
        hard_wrap: true,
        link_attributes: { rel: 'nofollow', target: "_blank" }
    }

    extensions = {
        autolink: true,
        highlight: true,
        superscript: true,
        disable_indented_code_blocks: true,
        space_after_headers: true,
        fenced_code_blocks: true,
        quote: true,
        strikethrough: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    syntax_highlighter(markdown.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

end
