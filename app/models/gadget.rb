class Gadget < ApplicationRecord
  belongs_to :post

  enum genre: { keyboard: 0, monitor: 1 }
end
