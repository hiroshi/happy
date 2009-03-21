class CreateInitialTables < ActiveRecord::Migration
  def self.up
    create_table :happies do |t|
      t.integer :host_person_id, :null => false
      t.integer :guest_person_id, :null => false
      t.string :url, :null => false

      t.timestamps
    end

#     create_table :sites do |t|
#       t.string :uri, :null => false

#       t.timestamps
#     end

    create_table :people do |t|
      t.string :session_key
      t.string :identity_url
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :people
    drop_table :happies
  end
end
