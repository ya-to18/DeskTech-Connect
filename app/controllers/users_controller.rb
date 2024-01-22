class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def show
    current_user
  end

  def posts
    @pagy, @posts= pagy(Post.where(user_id: current_user.id).order(created_at: :desc))
  end

  def likes
    @pagy, @posts = pagy(current_user.liked_posts)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, flash: { success: 'アカウントを登録しました' }
    else
      flash.now[:error] = 'アカウント登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(name: params[:name])
      respond_to do |format|
        format.html { redirect_to user_path(current_user)}
        flash.now[:success] = '更新されました'
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { current_user }
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name)
  end
end
