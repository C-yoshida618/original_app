class ShippingCost < ApplicationRecord
  
  def self.cost(prefecture_name)
    if ['北海道', '沖縄県'].include?(prefecture_name)
      1500
    else
  800
    end
  end

end



