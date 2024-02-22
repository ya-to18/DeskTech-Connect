class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def show
    current_user
  end

  def edit; end

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
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to user_path(@user)}
        flash.now[:success] = '更新されました。'
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { @user }
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
