class PostsController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_params)
    if @post_form.valid?
      @post_form.save
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
    params.require(:post_form).permit(:image, :name, :brand, :price, :image_url, :genre).merge(user_id: current_user.id)
  end
end
