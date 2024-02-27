class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to posts_path, flash: { success: t('.success') }
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: t('.success') }
  end
end
