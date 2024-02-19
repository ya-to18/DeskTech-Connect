class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present?
      redirect_to root_path, success: ('Twitterアカウントでのアカウント作成に成功しました')
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      redirect_to my_page_path, flash: { success: 'Twitterでログインしました。' }
    rescue StandardError
      logger.error "Twitterログイン時にエラーが発生しました: #{e.message}"
      logger.error e.backtrace.join("\n")
      redirect_to root_path, flash: { error: 'Twitterでログインできませんでした。' }
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
