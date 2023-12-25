class Gadget < ApplicationRecord
  belongs_to :post

  enum genre: { keyboard: 0, monitor: 1 }

  validates :name, :brand, :price, :image_url, :genre, presence: true
end
