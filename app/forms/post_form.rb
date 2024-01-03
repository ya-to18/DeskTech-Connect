# class PostForm
#   include ActiveModel::Model
#   extend CarrierWave::Mount

#   attr_accessor :user_id, :image, :name, :brand, :price, :image_url, :genre

#   validates :name, :brand, :price, :image_url, :genre, presence: true

#   mount_uploader :image, PostImageUploader

#   delegate :persisted, to: :post

#   def initialize(attributes = nil, post: Post.new, gadget: Gadget.new)
#     @post = post
#     @gadget = gadget
#     attributes ||= default_attributes
#     super(attributes)
#   end

#   def save
#     return false unless valid?

#     ActiveRecord::Base.transaction do
#       post = Post.create!(user_id:, image:)
#       gadget = post.gadgets.create!(name:, brand:, price:, image_url:, genre:)
#     end
#   rescue ActiveRecord::RecordInvalid
#     false
#   end

#   private

#   attr_reader :post, :gadget

#   def default_attributes
#     {
#       user_id: post.user_id,
#       image: post.image,
#       name: gadget.name,
#       brand: gadget.brand,
#       price: gadget.price,
#       image_url: gadget.image_url,
#       genre: gadget.genre
#     }
#   end
# end