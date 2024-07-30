class ShippingCost < ApplicationRecord
  has_many :orders
  ShippingCost.create(name: '北海道・沖縄', cost: 1500)
  ShippingCost.create(name: 'その他', cost: 800)
end
