class PostForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  attr_accessor :user_id, :image

  mount_uploader :image, PostImageUploader

  delegate :persisted, to: :post

  def initialize(arttributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    Activerecord::Base.transaction do
      Post.create(user_id:, image:)
    end
  rescue Activerecord::RecordInvalid
    false
  end

  private

  attr_reader :post

  def default_attributes
    {
      user_id: post.user_id,
      image: post.image
    }
  end
end