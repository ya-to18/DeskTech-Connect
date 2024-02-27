class PostsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: %i[ index ]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :current_user_post, only: %i[ edit update destroy ]

  def index
    @q = Post.ransack(params[:q])
    @pagy, @posts = pagy(@q.result(distinct: true).includes(:user).order("created_at desc"), items: 9)
    render 'index' if params[:page]
  end

  def ranking; end

  def liked_posts
    @posts = Post.likes
  end

  def show; end

  def new
    @post = Post.new
    @post.gadgets.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), flash: { success: t('.success') }
    else
      flash.now[:error] = t('.error')
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    if @post.destroy!
      redirect_to posts_path, status: :see_other, flash: { success: t('.success') }
    end
  end

  def rakuten_search
    unless params[:keyword] == ""
      @items = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :content, gadgets_attributes: [:id, :name, :brand, :price, :image_url, :genre, :maker_name, :maker_code, :product_url, :product_id, :_destroy]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def current_user_post
    unless current_user.id == @post.user.id
      redirect_to posts_path(@post.id), flash: { error: t('posts.current_user_post.error') }
    end
  end

end
