module ApplicationHelper
  include GitlabMarkdownHelper
  
  def ccap_date( some_date )
    return '-' if some_date.blank?
    some_date.strftime('%m-%d-%Y')
  end

  def ccap_timestamp( some_datetime )
    return '-' if some_datetime.blank?
    some_datetime.strftime('%m-%d-%Y %I:%M %p')
  end

  def ccap_time( some_time )
    return '-' if some_time.blank?
    some_time.strftime('%I:%M %p')
  end

  def ccap_datetime( some_time )
    return '-' if some_time.blank?
    some_time.strftime('%m-%d-%Y %I:%M %p')
  end

  def page_title( title )
    capture_haml do
      haml_tag :h3, title
    end
  end

  # ERB ONLY
  def explain_errors(model)
    if model.present? && model.errors.any?
      html = ""
      html << content_tag(:h4) do
        <<-HERE_DOC
          #{pluralize( model.errors.count, "error")} prohibited this
          #{ model.class } from being saved:
        HERE_DOC
      end
      html << content_tag(:ul) do
        model.errors.full_messages.each {|msg|
          concat(content_tag(:li, msg, class: 'text-error'))
        }
      end
      html.html_safe
    end
  end

  def twitterized_type(type)
    case type
    when :alert   then "alert alert-warning"
    when :error   then "alert alert-error"
    when :notice  then "alert alert-info"
    when :success then "alert alert-success"
    else type.to_s
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
