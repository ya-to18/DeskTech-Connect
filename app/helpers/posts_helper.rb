module PostsHelper
  def brand_remove_duplicate(post_id)
    post = Post.find(post_id)
    brands = post.gadgets.map(&:brand).uniq
    brands.delete('')
    brands
  end

  def main_image_existence(post)
    if post.image.present?
      post.image.url(:index_size)
    else
      'post/default.png'
    end
  end

  def my_post?(post)
    current_user.id == post.user.id
  end

  def first_place?(rank)
    rank == 1
  end

  def display_rank(rank)
    if rank <= 3
      image_file =
        case rank
        when 1
          'rank/rank1.png'
        when 2
          'rank/rank2.png'
        when 3
          'rank/rank3.png'
        end

      image_tag(image_file, class: 'w-10 md:w-20')
    else
      content_tag(:p, "#{rank}位", class: 'text-lg font-bold')
    end
  end
end
