class Site < ActiveRecord::Base
  has_many :happies, :dependent => :destroy
  has_many :guests, :through => :happies, :source => :person
end
