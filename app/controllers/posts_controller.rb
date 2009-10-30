class PostsController < ApplicationController
  include AuthenticatedSystem

  before_filter :login_required

  def new
    @topic = Topic.find params[:topic_id]
    @forum = Forum.find params[:forum_id]
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:topic_id])
    @post.forum_id = @forum.id
    @post.topic = @topic
    @post.user = current_user
    if @post.save
      @topic.add_reply @post
      current_user.prestige += 1    #回复加1分
      current_user.save

      redirect_to forum_topic_path(@forum,@topic)
    else
      render :controller=>'posts', :action=>'new'
    end
  end
end
