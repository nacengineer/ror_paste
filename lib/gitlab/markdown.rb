module Gitlab
  # Custom parser for GitLab-flavored Markdown
  #
  # It replaces references in the text with links to the appropriate items in
  # GitLab.
  #
  # Supported reference formats are:
  #   * @foo for team members
  #   * #123 for issues
  #   * !123 for merge requests
  #   * $123 for snippets
  #   * 123456 for commits
  #
  # It also parses Emoji codes to insert images. See
  # http://www.emoji-cheat-sheet.com/ for a list of the supported icons.
  #
  # Examples
  #
  #   >> gfm("Hey @david, can you fix this?")
  #   => "Hey <a href="/gitlab/team_members/1">@david</a>, can you fix this?"
  #
  #   >> gfm("Commit 35d5f7c closes #1234")
  #   => "Commit <a href="/gitlab/commits/35d5f7c">35d5f7c</a> closes <a href="/gitlab/issues/1234">#1234</a>"
  #
  #   >> gfm(":trollface:")
  #   => "<img alt=\":trollface:\" class=\"emoji\" src=\"/images/trollface.png" title=\":trollface:\" />
  module Markdown

    attr_reader :html_options

    # Public: Parse the provided text with GitLab-Flavored Markdown
    #
    # text         - the source text
    # html_options - extra options for the reference links as given to link_to
    #
    # Note: reference links will only be generated if @project is set
    def gfm(text, html_options = {})
      return text if text.nil?

      # Duplicate the string so we don't alter the original, then call to_str
      # to cast it back to a String instead of a SafeBuffer. This is required
      # for gsub calls to work as we need them to.
      text = text.dup.to_str

      @html_options = html_options

      # Extract pre blocks so they are not altered
      # from http://github.github.com/github-flavored-markdown/
      text.gsub!(%r{<pre>.*?</pre>|<code>.*?</code>}m) { |match| extract_piece(match) }
      # Extract links with probably parsable hrefs
      text.gsub!(%r{<a.*?>.*?</a>}m) { |match| extract_piece(match) }
      # Extract images with probably parsable src
      text.gsub!(%r{<img.*?>}m) { |match| extract_piece(match) }

      # Insert pre block extractions
      text.gsub!(/\{gfm-extraction-(\h{32})\}/) {insert_piece($1)}

      sanitize_text(text)
    end

    private

    def sanitize_text(text)
      sanitize text.html_safe, attributes: ActionView::Base.sanitized_allowed_attributes + %w(id class),
        tags: ActionView::Base.sanitized_allowed_tags + %w(table tr td th)
    end

    def sanitize_attibutes

    end

    def extract_piece(text)
      @extractions ||= {}

      md5 = Digest::MD5.hexdigest(text)
      @extractions[md5] = text
      "{gfm-extraction-#{md5}}"
    end

    def insert_piece(id)
      @extractions[id]
    end

  end
end
