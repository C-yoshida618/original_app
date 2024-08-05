class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana])
  end

  def after_sign_in_path_for(resource)
    product_id = session[:desired_product_id] # 例えばセッションから取得
    if product_id
      new_product_order_path(product_id: product_id)
    else
      products_path # デフォルトのリダイレクト先
    end
  end

  def after_sign_up_path_for(resource)
    products_path # 登録後のデフォルトのリダイレクト先
  end
end
