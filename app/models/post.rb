class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :image, PostImageUploader
end
