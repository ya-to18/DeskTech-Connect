class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @recent_3_posts = Post.order(created_at: :desc).limit(4)

    if logged_in?
      redirect_to my_page_path
    end
  end
end
