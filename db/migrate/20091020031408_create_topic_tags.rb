class CreateTopicTags < ActiveRecord::Migration
  def self.up
    create_table :topic_tags do |t|
      t.string :name
      t.integer :account
      t.integer :forum_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topic_tags
  end
end
