class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :posts

  validates :content, presence: true
end
