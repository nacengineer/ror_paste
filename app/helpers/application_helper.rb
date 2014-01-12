module ApplicationHelper
  include LinkHelper
  include FeedbackHelper
  include GitlabMarkdownHelper
  include DateHelper

  def site_title
    "You Paste, We Display it!"
  end

  def display_timestamp( some_datetime )
    return '-' if some_datetime.blank?
    some_datetime.strftime('%m-%d-%Y %I:%M %p')
  end

  def display_time( some_time )
    return '-' if some_time.blank?
    some_time.strftime('%I:%M %p')
  end

  def page_title( title )
    content_tag :h3, title
  end

  # monkey patch Redcarpet gem
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      if Pygments::Lexer.find(language)
        Pygments.highlight(code, lexer: language, options: {encoding: 'utf-8'})
      else
        Pygments.highlight(code, options: {encoding: 'utf-8'})
      end
    end
  end

  def css_from_string( css )
    capture_haml do
      haml_tag :style, :type=>"text/css" do
        haml_concat css
      end
    end
  end

  def badges(text, num)
    "<span class='badge'>#{num}</span> #{text}".html_safe
  end

  def glue_bottle_img
    image_tag("icon_12750/icon_12750.svg", class: 'img-responsive col-md-3')
  end

end
