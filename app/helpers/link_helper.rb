module LinkHelper
  def method_missing(meth, *args, &block)
    if meth.to_s =~ /\A(.+)(_link_text)\z/
      link_text($1, args.first, &block)
    elsif meth.to_s =~ /\A(.+)(_link_no_text)\z/
      link_no_text($1)
    elsif meth.to_s =~ /\A(.+)(_link_icon)\z/
      generic_link_icon
    else
      super
    end
  end

  def active_class(controller, action = 'index')
    compare = [controller.downcase, action.downcase]
    if controller_name && action_name &&
       (compare[-1] == 'all' && compare[0] == controller_name) ||
       (compare == [controller_name, action_name])
      'active'
    else
      ''
    end
  end

  private

  def link_text(name, args, &block)
    text = if args
      " #{args}"
    elsif controller_name
      " #{name} #{nice_label(controller_name.singularize)}"
    end
    send("#{name}_link_icon") << text.downcase
  end

  def link_no_text(name)
    send("#{name}_link_icon")
  end

  def nice_label(text)
    text.humanize.titleize
  end

  def generic_link_icon
    fa_icon 'external-link'
  end

  def index_link_icon
    fa_icon 'list'
  end

  def show_link_icon
    fa_icon 'search'
  end

  def delete_link_icon
    fa_icon 'trash-o'
  end

  def edit_link_icon
    fa_icon 'pencil'
  end

  def new_link_icon
    fa_icon 'plus-square'
  end

  def back_link_icon
    fa_icon 'arrow-left'
  end

  def download_link_icon
    fa_icon 'download'
  end

  def no_download_link_icon
    fa_icon 'exclamation'
  end

end
