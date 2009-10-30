class Forum < ActiveRecord::Base
  acts_as_tree

  has_many :topics

  def get_last_post
    Post.find(:first, :order=>'created_at desc', :conditions=>'forum_id ='+self.id.to_s)
  end

  def get_last_topic
    Topic.find(:first, :order=>'created_at desc', :conditions=>'forum_id =' + self.id.to_s)
  end
end
