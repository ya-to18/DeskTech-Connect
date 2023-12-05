class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
end
