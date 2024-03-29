class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :current_user_post, only: %i[edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @pagy, @posts = pagy(@q.result(distinct: true).includes(:user).order('created_at desc'), items: 9)
    render 'index' if params[:page]
  end

  def show
    @comments = @post.comments.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params.except(:gadgets_attributes))

    ActiveRecord::Base.transaction do
      @post.add_or_update_gadgets(post_params[:gadgets_attributes])
      @post.save!
    end

    redirect_to posts_path, flash: { success: t('.success') }
  rescue StandardError
    # @post.errors.add(:base, e.message)
    flash.now[:error] = t('.error')
    render :new, status: :unprocessable_entity
  end

  def update
    ActiveRecord::Base.transaction do
      @post.assign_attributes(post_params.except(:gadgets_attributes))
      @post.add_or_update_gadgets(post_params[:gadgets_attributes])
      @post.save!
    end

    redirect_to post_path(@post), flash: { success: t('.success') }
  rescue StandardError
    # @post.errors.add(:base, e.message)
    flash.now[:error] = t('.error')
    redirect_to edit_post_path(@post), flash: { error: t('.error') }
  end

  def destroy
    redirect_to posts_path, status: :see_other, flash: { success: t('.success') } if @post.destroy!
  end

  def rakuten_search
    return if params[:keyword] == ''

    @items = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
  end

  def ranking
  end

  def liked_posts
    @posts = Post.likes
  end

  private

  def post_params
    permitted_params = [
      :image,
      :content,
      { gadgets_attributes: [
        :id,
        :name,
        :brand,
        :price,
        :image_url,
        :product_url,
        :product_id,
        :genre_id,
        :_destroy,
        { maker_attributes: [
          :name,
          :code
        ] }
      ] }
    ]

    params.require(:post).permit(permitted_params).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def current_user_post
    return if current_user.id == @post.user.id

    redirect_to posts_path(@post.id), flash: { error: t('posts.current_user_post.error') }
  end
end
