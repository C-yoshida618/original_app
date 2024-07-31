class ShippingCost < ApplicationRecord
  has_many :orders
  belongs_to :prefecture
  ShippingCost.create(id: '北海道・沖縄', name: 1500)
  ShippingCost.create(id: 'その他', name: 800)
end
