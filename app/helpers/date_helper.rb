module DateHelper

  def display_datetime(datetime, opts = {short: true})
    datetime = datetime_parser(datetime)
    if    opts[:icon]  then datetime_w_icon(datetime)
    elsif opts[:long]  then datetime_long(datetime)
    elsif opts[:short] then datetime_short(datetime)
    elsif opts[:no_year] then datetime_no_year(datetime)
    else  datetime_short datetime
    end
  end

  def display_date(date, opts = {short: true})
    date = date_parser(date)
    if    opts[:icon]  then   date_w_icon(date)
    elsif opts[:long]  then   date_long(date)
    elsif opts[:short] then   date_short(date)
    elsif opts[:no_year] then date_no_year(date)
    else  date_short date
    end
  end

 private
  def datetime_w_icon(datetime)
    return String.new if datetime.blank?
    fa_icon('calendar') << " " << datetime_short(datetime)
  end

  def datetime_long(datetime)
    return String.new if datetime.blank?
    datetime.strftime("%A %B #{datetime.day.ordinalize}, %Y at %I:%M %p")
  end

  def datetime_short(datetime)
    return String.new if datetime.blank?
    datetime.strftime("%Y-%m-%d %H:%M")
  end

  def datetime_no_year(datetime)
    return String.new if datetime.blank?
    datetime.strftime("%B %d %H:%M")
  end

  def date_w_icon(date)
    return String.new if date.blank?
    fa_icon('calendar') << " " << date_short(date)
  end

  def date_no_time(date)
    return String.new if date.blank?
    date.strftime("%A, %b %-d, %Y")
  end

  def date_long(date)
    return String.new if date.blank?
    date.strftime("%A %B #{date.day.ordinalize}, %Y")
  end

  def date_short(date)
    return String.new if date.blank?
    date.strftime("%Y-%m-%d")
  end

  def date_no_year(date)
    return String.new if date.blank?
    date.strftime("%B %d")
  end

  def date_parser(date)
    return date if date.blank? || date.is_a?(Date)
    Date.parse date.to_s
  end

  def short_time(time)
    return String.new if time.blank?
    Time.parse(time.to_s).strftime("%l:%M %P")
  end

  def datetime_parser(datetime)
    return datetime if datetime.blank? || datetime.is_a?(DateTime)
    DateTime.parse datetime.to_s
  end


end
