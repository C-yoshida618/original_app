class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @product = Product.find(params[:product_id])
    @OrdersAddresses = OrdersAddresses.new
    # 必要な処理を行った後にリダイレクトする
    redirect_to root_path if @product.save
  end

  def show
    @order = Order.find(params[:id])
    @product = @order.product
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def complete
    # 注文完了ページの処理（注文情報などを表示）
  end

  def create
    @OrdersAddresses = OrdersAddresses.new(order_address_params)
    if @OrdersAddresses.valid?
      pay_item
      @OrdersAddresses.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:orders_addresses).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token], price: params[:price]
    )
  end

  def set_item
    @product = Product.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
