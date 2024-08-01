class ShippingCost < ApplicationRecord
  has_many :orders
  belongs_to :prefecture
  ShippingCost.create(id: '北海道・沖縄', name: 1500)
  ShippingCost.create(id: 'その他', name: 800)
end

# class ShippingCost < ApplicationRecord
  
#   def self.cost(prefecture_name)
#     if ['北海道', '沖縄県'].include?(prefecture_name)
#       1500
#     else
#       800
#     end
#   end

# end



