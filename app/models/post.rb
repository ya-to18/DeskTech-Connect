class Post < ApplicationRecord
  has_many :gadgets, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :gadgets, allow_destroy: true

  validates :image, presence: true
  validates :content, presence: true

  validates_associated :gadgets
  validates :gadgets, presence: true
  mount_uploader :image, PostImageUploader

  def liked_by?(user)
    if user.nil?
      return
    else
      likes.exists?(user_id: user.id)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["content"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["gadgets"]
  end

  def self.ranking
    Post.joins(:likes).group(:id).order('count(likes.id) desc').limit(10)
  end
end
