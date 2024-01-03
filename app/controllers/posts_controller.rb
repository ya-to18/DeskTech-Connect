class PostsController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @post = Post.new
    @post.gadgets.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:image, gadgets_attributes: [:id, :name, :brand, :price, :image_url, :genre]).merge(user_id: current_user.id)
  end
end
