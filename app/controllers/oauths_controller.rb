class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if @user = login_from(provider)
      redirect_to my_page_path, flash: { success: 'Twitterでログインしました。' }
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to my_page_path, flash: { success: 'Twitterでログインしました。' }

      rescue
        redirect_to root_path, flash: { error: 'Twitterでログインできませんでした。' }
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end
end
