class Post < ApplicationRecord
  has_many :post_gadgets, dependent: :destroy
  has_many :gadgets, through: :post_gadgets

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  belongs_to :user
  accepts_nested_attributes_for :gadgets, allow_destroy: true, reject_if: :all_blank

  validates :image, presence: true
  validates :content, presence: true

  validates_associated :gadgets
  validates :gadgets, presence: true
  mount_uploader :image, PostImageUploader

  def add_or_update_gadgets(gadget_attributes)
    raise StandardError, 'アイテムは１つ以上追加してください。' if gadget_attributes.nil?

    gadget_attributes.each do |attributes|
      existing_gadget = find_existing_gadget(attributes)
      if existing_gadget.present?
        update_existing_gadget(existing_gadget, attributes)
      else
        create_new_gadget(attributes)
      end
    end
  end

  def find_existing_gadget(attributes)
    Gadget.find_by(product_id: attributes[1][:product_id], genre_id: attributes[1][:genre_id])
  end

  def update_existing_gadget(existing_gadget, attributes)
    # maker = Maker.find_or_create_by!(name: attributes[1][:maker_attributes][:name])
    # existing_gadget.maker = maker
    existing_gadget.price = attributes[1][:price]

    i = attributes[0].to_i
    if i < 10_000 # _form.html.erbにindexを付与している。
      gadgets << existing_gadget
    elsif attributes[1][:_destroy].empty?
      existing_gadget.save!
    else
      # パラメータに_destroyが1の値がある時
      PostGadget.find_by(post_id: id, gadget_id: existing_gadget.id).destroy!
    end
  end

  def create_new_gadget(attributes)
    gadget = gadgets.build

    maker = Maker.find_or_create_by!(name: attributes[1][:maker_attributes][:name])

    gadget.name = attributes[1][:name]
    gadget.brand = attributes[1][:brand]
    gadget.price = attributes[1][:price]
    gadget.image_url = attributes[1][:image_url]
    gadget.product_url = attributes[1][:product_url]
    gadget.product_id = attributes[1][:product_id]
    gadget.genre_id = attributes[1][:genre_id]
    gadget.maker = maker
  end

  def liked_by?(user)
    return false if user.nil?

    likes.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(*)
    ['content']
  end

  def self.ransackable_associations(*)
    ['gadgets']
  end

  def self.ranking
    Post.joins(:likes).group(:id).order('count(likes.id) desc').limit(10)
  end
end
