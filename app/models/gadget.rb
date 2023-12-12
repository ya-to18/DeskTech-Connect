class Gadget < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :posts, through: :post_gadgets

  enum genre: { keyboard: 0, monitor: 1 }
end
