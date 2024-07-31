class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shipping_cost, class_name: 'ShippingCost'

end