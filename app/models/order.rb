class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :product
  belongs_to :shipping_cost, class_name: 'ShippingCost'

  validates :price, presence: true
  validates :token, presence: true
end