class ForumsController < ApplicationController
  before_filter :login_required, :except=>[:index, :show]
  def index
    @forums = Forum.find(:all, :conditions=>'parent_id>0')
  end

  def show
    @forum = Forum.find(params[:id])
#    @topics = Topic.find(:all, :conditions=>'forum_id='+@forum.id.to_s, :order=>'created_at DESC')
    @topics = Topic.paginate :page=>params[:page]||1, :per_page=>15,:conditions=>'forum_id='+@forum.id.to_s, :order=>'created_at DESC'
  end

  def find_tags
    @forum = Forum.find(params[:id])
    @topics = Topic.find_tag(params[:tags])
    render :action=>"show"
  end
end
