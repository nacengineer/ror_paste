module FeedbackHelper

  # For flash messages
  def twitterized_type(type)
    case type
    when :alert   then "alert alert-warning"
    when :error   then "alert alert-error"
    when :notice  then "alert alert-info"
    when :success then "alert alert-success"
    else type.to_s
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

  def data_viz_user_class(person = nil, grant = nil)
    if person && grant && grant.pis.include?(person)
      'text-success'
    elsif person && person.is_an?(:researcher)
      'text-info'
    elsif person && person.is_an?(:support)
      'text-warning'
    elsif person && person.is_an?(:admin)
      'text-danger'
    else
      ''
    end
  end

end
