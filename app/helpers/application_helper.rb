module ApplicationHelper
  include GitlabMarkdownHelper
  include FeedbackHelper
  include LinkHelper

  def display_date( some_date )
    return '-' if some_date.blank?
    some_date.strftime('%m-%d-%Y')
  end

  def display_timestamp( some_datetime )
    return '-' if some_datetime.blank?
    some_datetime.strftime('%m-%d-%Y %I:%M %p')
  end

  def display_time( some_time )
    return '-' if some_time.blank?
    some_time.strftime('%I:%M %p')
  end

  def display_datetime( some_time )
    return '-' if some_time.blank?
    some_time.strftime('%m-%d-%Y %I:%M %p')
  end

  def page_title( title )
    capture_haml do
      haml_tag :h3, title
    end
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

  def show_text
    "<i class='icon-camera-retro'></i> Show".html_safe
  end

  def edit_text
    "<i class='icon-pencil'></i> Edit".html_safe
  end

  def delete_text
    "<i class='icon-trash'></i> Delete".html_safe
  end

  def badges(text, num)
    "<span class='badge'>#{num}</span> #{text}".html_safe
  end

end
