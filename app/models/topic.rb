class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many   :posts

  validates_presence_of     :subject, :content

  def add_hits
    self.hits += 1
    save!
  end

  def add_reply(post)
    self.replies += 1
    self.last_poster = post.user.login
    self.lastpost_at = Time.now
    save!
  end

  # 今天有几个主题
  def self.count_topics_of_today(forum=nil)
    sql = "Select count(*) as today from topics where created_at >'" + Time.now.strftime('%Y-%m-%d') + "'"
    sql += ' and forum_id = ' + forum.id.to_s unless forum==nil
    f = Topic.find_by_sql(sql)
    f[0].today
  end

  # 主题贴总数
  def self.count_topics(forum=nil)
    sql = 'Select count(*) as a from topics '
    sql = sql + " Where forum_id = " + forum.id.to_s unless forum==nil
    t = Topic.find_by_sql sql
    t[0].a
  end

  # 查找tag
  def self.find_tag(tag)
    sql = "select * from topics where tag like '%#{tag}%'"
    Topic.find_by_sql(sql)
  end

end
