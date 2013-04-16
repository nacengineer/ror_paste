class Paste < ActiveRecord::Base
  attr_accessible :expire, :paste, :title
  include ActionView::Helpers::TextHelper
  self.per_page = 10

  def self.expires_after(date = Time.now - 7.days)
    where('expire >= ?', date).default_order
  end

  def self.expired(date = Time.now - 7.days)
    where('expire <= ?', date).default_order
  end

  def self.default_order
    order('created_at DESC')
  end

  def read_title
    title if title.present?
    truncate(paste, length: 100)
  end

end
