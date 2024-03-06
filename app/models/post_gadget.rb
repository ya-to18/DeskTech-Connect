class PostGadget < ApplicationRecord
  belongs_to :post
  belongs_to :gadget
end
