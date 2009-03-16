class CreateInitialTables < ActiveRecord::Migration
  def self.up
    create_table :happies do |t|
      t.integer :site_id, :null => false

      t.timestamps
    end

    create_table :sites do |t|
      t.string :uri, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
    drop_table :happies
  end
end
