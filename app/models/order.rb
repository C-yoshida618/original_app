class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shipping_cost, class_name: 'ShippingCost'

  # 他の関連やバリデーションなど
end