class Jia::AccountController < ApplicationController

  layout 'jia_account'
  
  def index
  end

  def change_photo
    @photo = Photo.new
    #@photo = Photo.find(current_user.photo_id) unless current_user.photo_id == 0
  end

  def upload_photo
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    @photo.save

    current_user.photo_id = @photo.id
    current_user.save
    render :action=>"change_photo"
  end
end
