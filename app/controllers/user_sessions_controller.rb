class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to posts_path, flash: { success: 'ログインしました' }
    else
      flash.now[:error] = 'ログインに失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: 'ログアウトしました' }
  end
end
