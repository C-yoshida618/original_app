class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana])
  end
end
