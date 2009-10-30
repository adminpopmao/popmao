class AddPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_id, :integer, :default => 0
  end

  def self.down
    remove_column :users, :photo_id
  end
end
