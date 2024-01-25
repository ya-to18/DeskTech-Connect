class LikesController < ApplicationController
  before_action :require_login
  before_action :set_post

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
