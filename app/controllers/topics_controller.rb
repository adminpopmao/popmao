class TopicsController < ApplicationController
#include AuthenticatedSystem
  before_filter :login_required, :except=>[:index, :show]

  layout "show_topic"

  def index
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new
    @photo = Photo.new
    session[:this_upload] = nil
  end

  def add_photo
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    @photo.save

    session[:this_upload] ||= []
    session[:this_upload] << @photo.id

    responds_to_parent do
      render :update do |page|
        page.insert_html :bottom, "myphoto", :partial=>'photo', :object=>@photo
        page.visual_effect :highlight, "myphoto"
      end
    end

  end

  def create
    @topic = Topic.new(params[:topic])
    @forum = Forum.find(params[:forum_id])
    @topic.forum = @forum
    @topic.user = current_user
    if @topic.save
      # 将上传的图片设置为当前使用的帖子
      upload_photo = Photo.find(session[:this_upload]) if session[:this_upload]
      upload_photo = [] if upload_photo == nil
      upload_photo.each do |photo|
        photo.topic_id = @topic.id
        photo.save
      end
      session[:this_upload] = nil
      # 新增帖子将会增加二个金币
      current_user.gold += 2
      # 新增帖子会增加二点威望
      current_user.prestige += 2
      current_user.save

      #标签处理
      TopicTag.add_tag(@topic.tag,@forum.id)

      redirect_to forum_path(@topic.forum)
    else
      render :action=>'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @forum = @topic.forum
    @posts = Post.paginate :page=>params[:page]||1, :per_page=>15,:conditions=>'topic_id='+@topic.id.to_s, :order=>'created_at'
    @post = Post.new

    # 增加主题贴的点击数
    @topic.add_hits
  end

end
