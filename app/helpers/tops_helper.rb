module TopsHelper
  def login_user
    if current_user
      my_page_path
    else
      root_path
    end
  end
end
