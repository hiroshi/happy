class CreateInitialTables < ActiveRecord::Migration
  def self.up
    create_table :happies do |t|
      t.integer :site_id, :null => false
      t.integer :person_id, :null => false

      t.timestamps
    end

    create_table :sites do |t|
      t.string :uri, :null => false

      t.timestamps
    end

    create_table :people do |t|
      t.string :session_key
      t.string :open_id_uri
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
    drop_table :happies
  end
end
