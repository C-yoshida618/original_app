class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to complete_orders_path
    else
      render :new
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :shipping_cost)
  end
end