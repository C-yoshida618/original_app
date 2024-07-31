class ShippingCostsController < ApplicationController
  def index
    prefecture_id = params[:prefecture_id]
    shipping_cost = ShippingCost.find_by(prefecture_id: prefecture_id)
    if shipping_cost
      render json: { cost: shipping_cost.cost }
    else
      render json: { cost: nil }
    end
  end
end