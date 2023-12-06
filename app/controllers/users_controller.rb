class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, flash: { success: 'アカウントを登録しました。' }
    else
      flash.now[:error] = 'アカウント登録に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name)
  end
end
