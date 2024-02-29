class MyPagesController < ApplicationController
  def home
    @user = User.find(current_user.id)
    loado_my_posts
  end

  def my_posts
    loado_my_posts
  end

  def liked
    @pagy, @posts = pagy(current_user.liked_posts.includes(:user).order(created_at: :desc), items: 9)
  end

  private

  def loado_my_posts
    @pagy, @posts = pagy(Post.where(user_id: current_user.id).includes(:user).order(created_at: :desc), items: 9)
  end
end
