class Post < ApplicationRecord
  has_many :gadgets, dependent: :destroy
  belongs_to :user

  mount_uploader :image, PostImageUploader
end
