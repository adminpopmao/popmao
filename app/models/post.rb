class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user


  validates_presence_of     :content
  
  # 帖子总数
  def self.count_posts(forum=nil)
    sql = 'Select count(*) as a from posts'
    sql = sql + ' Where forum_id = ' + forum.id.to_s unless forum==nil
    t = Topic.find_by_sql sql
    t[0].a
  end


end
