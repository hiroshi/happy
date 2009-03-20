class Happy < ActiveRecord::Base
  belongs_to :site
  belongs_to :person

  named_scope :by_person, lambda {|person| {:conditions => ["happies.person_id = ?", person]}}
end
