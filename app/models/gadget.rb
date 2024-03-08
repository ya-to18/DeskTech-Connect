class Gadget < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :posts, through: :post_gadgets
  belongs_to :genre
  belongs_to :maker
  accepts_nested_attributes_for :maker

  enum genre: { pc: 0, monitor: 1, keyboard: 2, mouse: 3, desk: 4, chair: 5, other: 6 }

  validates :name, :price, :image_url, presence: true

  def self.ransackable_attributes(*)
    %w[brand genre name]
  end
end
