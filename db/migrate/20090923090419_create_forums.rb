class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string  :name,          :limit => 50
      t.integer :position,      :default=>0
      t.string  :all_keys
      t.string  :description
      t.integer :parent_id,     :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
