module TopsHelper
  def login_user
    if current_user
      posts_path
    else
      root_path
    end
  end
end
