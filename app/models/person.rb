class Person < ActiveRecord::Base
  has_many :host_happies, :class_name => "Happy", :dependent => :destroy, :foreign_key => "host_person_id"
  has_many :guest_happies, :class_name => "Happy", :dependent => :destroy, :foreign_key => "host_person_id"
#  has_many :host_sites, :through => :happies, :source => :site

  def authenticated?
    !self.identity_url.blank?
  end
end
