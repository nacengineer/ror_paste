class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'js_date input-group date') do
      template.concat @builder.text_field(attribute_name,
        all_input_opts(input_html_options)) + span_div
    end
  end

  def all_input_opts(passed_opts)
    needed_opts = {data: {format: "DD/MM/YYYY HH:mm"}, class: 'form-control'}
    passed_opts.reverse_merge!(needed_opts)
  end

  def span_div
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_div.html_safe
    end
  end

  def icon_div
    "<span class='fa fa-calendar' data-time-icon='fa fa-time' data-date-icon='fa fa-calendar'></span>"
  end
end
