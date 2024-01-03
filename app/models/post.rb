class Post < ApplicationRecord
  has_many :gadgets, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :gadgets, allow_destroy: true

  validates_associated :gadgets

  validates :gadgets, presence: true

  mount_uploader :image, PostImageUploader
end
