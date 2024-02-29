class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def sended_mail
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return if @user.present?

    not_authenticated
  end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to(sended_mail_password_resets_path, flash: { success: t('.success') })
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to(after_setting_password_resets_path, success: t('.success'))
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def after_setting
  end
end
