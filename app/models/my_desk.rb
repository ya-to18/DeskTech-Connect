class MyDesk < ApplicationRecord
  has_many :my_desk_gadgets, dependent: :destroy

  has_many :gadgets, through: :my_desk_gadgets

  belongs_to :user
end
