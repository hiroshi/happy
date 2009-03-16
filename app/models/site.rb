class Site < ActiveRecord::Base
  has_many :happies, :dependent => :destroy
end
