class Gadget < ApplicationRecord
  belongs_to :post

  enum genre: { keyboard: 0, monitor: 1, PC: 2, mouse: 3, dessk: 4, chair: 5, other: 6 }

  validates :name, :brand, :price, :image_url, :genre, presence: true
end
