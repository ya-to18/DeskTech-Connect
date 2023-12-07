class Gadget < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :posts, through: :post_gadgets
end
