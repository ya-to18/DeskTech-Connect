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
      post.image.url
    else
      'no_image.png'
    end
  end
end
