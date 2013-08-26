module LinkHelper

  def new_link_text(text = '')
    new_link_icon << (text.blank? ? " New #{nice_label controller_name.singularize}" : " #{text}")
  end

  def edit_link_text(text = '')
    edit_link_icon << (text.blank? ? " Edit #{nice_label controller_name.singularize}" : " #{text}")
  end

  def delete_link_text(text = '')
    delete_link_icon << (text.blank? ? " Delete #{nice_label controller_name.singularize}" : " #{text}")
  end

  def show_link_text(text = '')
    show_link_icon << (text.blank? ? " Show #{nice_label controller_name.singularize}" : " #{text}")
  end

  def index_link_text(text = '')
    index_link_icon << (text.blank? ? " All #{nice_label controller_name}" : " #{text}")
  end

  def new_link_no_text
    new_link_icon
  end

  def edit_link_no_text
    edit_link_icon
  end

  def delete_link_no_text
    delete_link_icon
  end

  def show_link_no_text
    show_link_icon
  end

  def index_link_no_text
    index_link_icon
  end

  def nice_label(text)
    text.humanize.titleize
  end

  def active_class(controller, action = 'index')
    compare = [controller.downcase, action.downcase]
    if compare[-1] == 'all' && compare[0] == controller_name
      'active'
    elsif compare == [controller_name, action_name]
      'active'
    else
      ''
    end
  end

  private

  def index_link_icon
    "<i class='icon-list'></i>".html_safe
  end

  def show_link_icon
    "<i class='icon-search'></i>".html_safe
  end

  def delete_link_icon
    "<i class='icon-trash'></i>".html_safe
  end

  def edit_link_icon
    "<i class='icon-pencil'></i>".html_safe
  end

  def new_link_icon
    "<i class='icon-plus-sign'></i>".html_safe
  end

end
