class CreateHappies < ActiveRecord::Migration
  def self.up
    create_table :happies do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :happies
  end
end
