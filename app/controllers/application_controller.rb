class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, flash: { danger: t('application.danger') }
  end
end
