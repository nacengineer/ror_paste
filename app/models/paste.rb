class Paste < ActiveRecord::Base
  attr_accessible :expire, :paste, :title

  def self.expires_after(date)
    where('expire >= ?', date)
  end

  def self.expired
    where('expire <= ?', Time.now)
  end

end
