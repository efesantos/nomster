class Photo < ActiveRecord::Base
  belongs_to :place

  mount_uploader :picture, PictureUploader

  validates :caption, :picture, presence: true
  
end
