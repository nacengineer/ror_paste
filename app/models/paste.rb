class Paste < ActiveRecord::Base
  attr_accessible :expire, :paste, :title

  self.per_page = 10

  def self.expires_after(date = Time.now - 7.days)
    where('expire >= ?', date).default_order
  end

  def self.expired
    where('expire <= ?', Time.now).default_order
  end

  def self.default_order
    order('created_at DESC')
  end

end
