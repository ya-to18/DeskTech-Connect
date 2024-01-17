module PostsHelper
  def brand_remove_duplicate(post)
    post = Post.find(post)
    @brand = post.gadgets.map { |gadget| gadget.brand }.uniq
    if @brand.include?('')
      @brand.delete('')
    end
  end

  def main_image_existence(post)
    if post.image.present?
      post.image.url(:index_size)
    else
      'default.png'
    end
  end

  def my_post?(post)
    current_user.id == post.user.id
  end
end
