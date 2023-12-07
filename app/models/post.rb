class Post < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :gadgets, through: :post_gadgets
  belongs_to :user

  mount_uploader :image, PostImageUploader
end
