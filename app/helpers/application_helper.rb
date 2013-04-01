module ApplicationHelper

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

   def explain_errors( model )
    if model.present? && model.errors.any?
      capture_haml do
        haml_tag :h4 do
          haml_concat <<-HERE_DOC
            #{pluralize( model.errors.count, "error")} prohibited this
            #{ model.class } from being saved:
          HERE_DOC
        end
        haml_tag :ul do
          model.errors.full_messages.each do |msg|
            haml_tag :li, msg
          end
        end
      end
    end
  end

  def explain_errors( model )
    if model.present? && model.errors.any?
      capture_haml do
        haml_tag :h4 do
          haml_concat <<-HERE_DOC.unindent
            #{pluralize( model.errors.count, "error")} prohibited this
            #{ model.class } from being saved:
          HERE_DOC
        end
        haml_tag :ul do
          model.errors.full_messages.each do |msg|
            haml_tag :li, msg
          end
        end
      end
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


  def markdown(text)
    unless @markdown
      gitlab_renderer = Redcarpet::Render::GitlabHTML.new(self,
                          # see https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch-
                          filter_html: true,
                          with_toc_data: true,
                          hard_wrap: true)
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
