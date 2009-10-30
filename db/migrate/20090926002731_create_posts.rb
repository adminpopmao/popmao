class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :forum_id, :default=>0
      t.integer :topic_id, :default=>0
      t.integer :user_id,  :default=>0
      t.string  :subject,  :limit=>60
      t.text    :content

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
