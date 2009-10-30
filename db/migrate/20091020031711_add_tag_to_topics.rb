class AddTagToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :tag, :string
  end

  def self.down
    remove_column :topics, :tag
  end
end
