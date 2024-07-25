class OrdersController < ApplicationController
  # 認証や認可のフィルターを追加できます
  before_action :authenticate_user!, only: [:new, :creates]

  def index
    # 注文の一覧を取得する
    @orders = current_user.orders.includes(:product)
    @products = @orders.map(&:product)
  end

  def show
    # 特定の注文を表示する
    @order = Order.find(params[:id])
    @product = @order.product
  end

  def new
    # 新しい注文を作成するためのフォームを表示する
    @order = Order.new
  end

  def create
    # 新しい注文を作成する
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
    # 注文を編集するためのフォームを表示する
    @order = Order.find(params[:id])
  end

  def update
    # 注文を更新する
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # 注文を削除する
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  # Strong Parameters
  def order_params
    params.require(:order).permit(:product_id, :shipping_cost)
  end
end
