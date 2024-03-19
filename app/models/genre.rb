class Genre < ApplicationRecord
  has_many :gadgets, dependent: :destroy

  validates :name, uniqueness: true

  def self.ransackable_attributes(*)
    %w[name]
  end
end
