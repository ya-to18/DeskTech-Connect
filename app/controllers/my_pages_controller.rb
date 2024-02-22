class MyPagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @latest_post = current_user.posts.last
    @pagy_my_post, @my_posts= pagy(Post.where(user_id: current_user.id).includes(:user).order("created_at desc"), items: 9)
    @pagy_like, @like_posts = pagy(current_user.liked_posts.includes(:user).order(created_at: :desc), items: 9)
    render 'index' if params[:page]
  end
end
