class Paste < ActiveRecord::Base
  attr_accessible :js_expire, :expire, :paste, :title
  include ActionView::Helpers::TextHelper
  self.per_page = 10

  class << self
    def expires_after(date = expire_period)
      where('expire >= ?', date).default_order
    end

    def expired(date = expire_period)
      where('expire <= ?', date).default_order
    end

    def default_order
      order('created_at DESC')
    end

    def expire_period
      # TODO Refactor this!
      eval "Time.now - #{RorPaste::SETTINGS[:expire_period]}"
    end
  end

  def read_title
    title if title.present?
    truncate(paste, length: 100)
  end

  def js_expire=(time)
    write_attribute :expire, parse_us_time(time)
  end

  def js_expire
    time_format read_attribute(:expire)
  end

  private

  def expire_period
    Paste.expire_period
  end

  def time_format(time)
    time.present? ? time.localtime.strftime("%m/%d/%Y %I:%M %p") : time
  end

  def parse_us_time(time)
    return time if time.blank?
    time_with_zone = "#{time} #{DateTime.now.strftime("%z")}"
    DateTime.strptime(time_with_zone,"%m/%d/%Y %I:%M %p %z").to_time
  end


end
