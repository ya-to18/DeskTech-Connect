class Maker < ApplicationRecord
  has_many :gadgets, dependent: :destroy
end
