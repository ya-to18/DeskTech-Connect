class Gadget < ApplicationRecord
  belongs_to :post

  enum genre: { pc: 0, monitor: 1, keyboard: 2, mouse: 2, desk: 4, chair: 5, other: 6 }

  validates :name, :price, :image_url, :genre, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["brand", "genre", "name"]
  end
end
