class Genre < ApplicationRecord
  has_many :gadgets, dependent: :destroy

  validates :name, uniqueness: true
end
