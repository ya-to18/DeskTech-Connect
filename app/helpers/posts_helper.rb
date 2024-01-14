module PostsHelper
  def brand_remove_duplicate(post)
    post = Post.find(post)
    @brand = post.gadgets.map { |gadget| gadget.brand }.uniq
    if @brand.include?('')
      @brand.delete('')
    end
  end
end
