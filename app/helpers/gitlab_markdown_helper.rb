module GitlabMarkdownHelper
  include Gitlab::Markdown

  COLOR_SCHEMES = {
    1 => 'white',
    2 => 'dark',
    3 => 'solarized-dark',
    4 => 'monokai',
  }
  COLOR_SCHEMES.default = 'white'

  # Helper method to access the COLOR_SCHEMES
  #
  # The keys are the `color_scheme_ids`
  # The values are the `name` of the scheme.
  #
  # The preview images are `name-scheme-preview.png`
  # The stylesheets should use the css class `.name`
  def color_schemes
    COLOR_SCHEMES.freeze
  end

  def user_color_scheme_class
    COLOR_SCHEMES[current_user.try(:color_scheme_id)] if defined?(current_user)
  end

  def highlight_js(&block)
    string = capture(&block)

    content_tag :div, class: user_color_scheme_class do
      Pygments::Lexer[:js].highlight(string).html_safe
    end
  end

  # Use this in places where you would normally use link_to(gfm(...), ...).
  #
  # It solves a problem occurring with nested links (i.e.
  # "<a>outer text <a>gfm ref</a> more outer text</a>"). This will not be
  # interpreted as intended. Browsers will parse something like
  # "<a>outer text </a><a>gfm ref</a> more outer text" (notice the last part is
  # not linked any more). link_to_gfm corrects that. It wraps all parts to
  # explicitly produce the correct linking behavior (i.e.
  # "<a>outer text </a><a>gfm ref</a><a> more outer text</a>").
  def link_to_gfm(body, url, html_options = {})
        return "" if body.blank?

    escaped_body = if body =~ /^\<img/
                     body
                   else
                     escape_once(body)
                   end

    gfm_body = gfm(escaped_body, html_options)

    gfm_body.gsub!(%r{<a.*?>.*?</a>}m) do |match|
      "</a>#{match}#{link_to("", url, html_options)[0..-5]}" # "</a>".length +1
    end

    link_to(gfm_body.html_safe, url, html_options)

  end

  def markdown(text)
    unless @markdown
      gitlab_renderer = Redcarpet::Render::GitlabHTML.new(self,
                          # see https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch-
                          filter_html: true,
                          with_toc_data: true,
                          hard_wrap: true,
                          safe_links_only: true)
      @markdown = Redcarpet::Markdown.new(gitlab_renderer,
                      # see https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use
                      no_intra_emphasis: true,
                      tables: true,
                      fenced_code_blocks: true,
                      autolink: true,
                      strikethrough: true,
                      lax_html_blocks: true,
                      space_after_headers: true,
                      superscript: true)
    end

    @markdown.render(text).html_safe
  end


end

