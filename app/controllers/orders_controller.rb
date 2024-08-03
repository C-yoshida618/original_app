class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_order, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    # 必要な処理を行った後にリダイレクトする
  end

  def show
    @order = Order.find(params[:id])
    @product = @order.product
  end

  def create
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      @order = Order.last
      redirect_to product_order_path(@product, @order)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def set_item
    @product = Product.find(params[:product_id])
  end

  def move_to_order
    if @product.order.present?
      redirect_to products_path, alert: "この商品は既に購入されています。"
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,    # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'            # 通貨の種類（日本円）
    )
  end
end
