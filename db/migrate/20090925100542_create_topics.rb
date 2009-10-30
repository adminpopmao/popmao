class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer  :forum_id,     :default=>0
      t.integer  :user_id,      :default=>0
      t.string   :subject,      :limit => 60
      t.text     :content
      t.datetime :postdate_at,  :default=>Time.now
      t.datetime :lastpost_at,  :default=>Time.now
      t.string   :last_poster,  :limit => 20
      t.integer  :hits,         :default=>0
      t.integer  :replies,      :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
