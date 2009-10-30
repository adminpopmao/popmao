class Photo < ActiveRecord::Base
  acts_as_fleximage :image_directory => 'public/uploaded_photos'
  belongs_to :user
end
