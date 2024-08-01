class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # 商品IDを使って商品情報を取得
    @product = Product.find(params[:product_id])
    # 新しい注文オブジェクトを作成
    @orders = Order.new
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

  def create
    @product = Product.find(params[:product_id])
    @order = @product.order.build(order_params)
    @order.user = current_user

    if @order.save
      redirect_to products_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def order_params
    @order = Order.new
    params.require(:order).permit(:product_id, :card_number, :expiration_date, :security_code, :postal_code, :prefecture_id, :city, :block, :building, :phone_number)
  end
end
