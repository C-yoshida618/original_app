class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    product_id = session[:desired_product_id] # 例えばセッションから取得
    if product_id
      new_product_order_path(product_id: product_id)
    else
      products_path # デフォルトのリダイレクト先
    end
  end
end