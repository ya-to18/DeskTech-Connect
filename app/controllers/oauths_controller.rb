class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present?
      redirect_to root_path, flash: { success: t('.cancel') }
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      if @user.my_desks.empty?
        @user.my_desks.create!(name: "Default")
      end

      redirect_to my_page_path, flash: { success: t('.success') }
    rescue StandardError => e
      logger.error "t('.error') : #{e.message}"
      logger.error e.backtrace.join("\n")
      redirect_to root_path, flash: { error: t('.error') }
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
