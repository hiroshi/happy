class Happy < ActiveRecord::Base
  belongs_to :site
  belongs_to :person
end
