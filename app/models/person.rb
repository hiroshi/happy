class Person < ActiveRecord::Base
  has_many :happies, :dependent => :destroy
  has_many :host_sites, :through => :happies, :source => :site

  def authenticated?
    !self.identity_url.blank?
  end
end
