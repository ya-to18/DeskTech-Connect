class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @recent_3_posts = Post.order(created_at: :desc).limit(4)
  end
end
