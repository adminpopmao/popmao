class PhotosController < ApplicationController
  def create
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    if @photo.save
      flash[:notice] = '成功'
    else
      flash[:notice] = '失败'
    end
  end

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.jpg    # show.jpg.flexi (http://mysite.com/photos/123.jpg)
      format.html   # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

end
