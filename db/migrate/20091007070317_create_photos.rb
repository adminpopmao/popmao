class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :user_id, :default=>0
      t.integer :post_id, :default=>0
      t.integer :topic_id, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
