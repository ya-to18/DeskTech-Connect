class Gadget < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :my_desk_gadgets, dependent: :destroy

  has_many :posts, through: :post_gadgets

  belongs_to :genre
  belongs_to :maker
  accepts_nested_attributes_for :maker

  validates :name, :price, :image_url, presence: true

  def self.ransackable_attributes(*)
    %w[brand name]
  end

  def self.ransackable_associations(*)
    ['genre']
  end
end
