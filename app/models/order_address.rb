class OrderAddress
  include ActiveModel::Model
  attr_accessor  :token, :product_id, :user_id, :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number 

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :product_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :city
    validates :block
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
  
end