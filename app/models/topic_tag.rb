class TopicTag < ActiveRecord::Base
  # 增加标签
  def self.add_tag(tags,forum_id)
    all_tags = tags.split  # 将多个
    all_tags.each do |tag|
      find_tag = TopicTag.find(:first, :conditions=>"name='"+tag+"' and forum_id =" + forum_id.to_s)
      if find_tag
        find_tag.account += 1
        find_tag.save
      else
        TopicTag.create(:name=>tag,
                        :account=>1,
                        :forum_id=>forum_id)
      end
    end
  end

  def self.get_hot_tag(forum_id)
    TopicTag.find(:all, :limit=>10, :order=>'account DESC', :conditions=>'forum_id ='+forum_id.to_s)
  end
end
