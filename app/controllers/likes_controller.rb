class LikesController < ApplicationController
  before_action :set_post, only: %i[index create destroy]

  def index
    @liked_users = @post.liked_users
  end

  def create
    like = current_user.likes.new(post_id: @post.id)
    like.save!
    render partial: 'posts/likes/like', locals: { post: @post }
  end

  def destroy
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy!
    render partial: 'posts/likes/like', locals: { post: @post }
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
