class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all
  end

  def show
    if params[:keyword]
      @products = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
    end
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

  def search
    if params[:keyword]
      @products = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, gadgets_attributes: [:id, :name, :brand, :price, :image_url, :genre]).merge(user_id: current_user.id)
  end
end
