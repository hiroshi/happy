class Happy < ActiveRecord::Base
  belongs_to :host, :class_name => "Person", :foreign_key => "host_person_id"
  belongs_to :guest, :class_name => "Person", :foreign_key => "guest_person_id"

  named_scope :by_host, lambda {|person| {:conditions => ["happies.host_person_id = ?", person]}}
  named_scope :by_guest, lambda {|person| {:conditions => ["happies.guest_person_id = ?", person]}}
end
